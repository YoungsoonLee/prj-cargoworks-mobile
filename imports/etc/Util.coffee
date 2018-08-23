import stackNavigation from './stack_navigation.coffee'
import tabNavigation from './tab_navigation.coffee'
import { Alert } from 'react-native'
import { Accounts } from 'react-native-meteor'
import OneSignal from 'react-native-onesignal'

export default class Util
  @getVehicle: (_weight, _vehicle, TRANSPORTERS) =>
    WEIGHT = _.find TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
      WEIGHT.VALUE is _weight

    if WEIGHT # 퀵인 경우
      if WEIGHT.TEXT is '벤'
        WEIGHT.TEXT = '밴'

      vehicle = WEIGHT.TEXT

    else # 화물인 경우
      if _weight is TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.VALUE # 츄레라인 경우
        vehicle = '츄레라'

      else
        if not _weight or not _vehicle
          return

        WEIGHT = _.find TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS, (WEIGHT) =>
          WEIGHT.VALUE is _weight

        weight = WEIGHT.TEXT

        BOX_TYPE = _.find TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES, (BOX_TYPE) =>
          BOX_TYPE.VALUE is _vehicle

        if BOX_TYPE.VALUE is 'FREEZER'
          BOX_TYPE.TEXT = '냉탑'

        vehicle = "#{weight} #{BOX_TYPE.TEXT}"

    vehicle

  @getVehicleWeight: (_vehicle, TRANSPORTERS) =>
    vehicle = ''

    weight = ''

    if /[0-9]|츄레라/.test _vehicle # 화물인 경우
      if /츄레라/.test _vehicle # 츄레라인 경우
        weight = TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.VALUE

      else # 톤수가 있는 경우
        exec = /(.+톤) (.+)/.exec _vehicle

        _weight = exec[1]

        _vehicle = exec[2]

        WEIGHT = _.find TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS, (WEIGHT) =>
          WEIGHT.TEXT is _weight

        weight = WEIGHT.VALUE

        if _vehicle is '카고'
          vehicle = TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.CARGO.VALUE

        else if _vehicle is '탑'
          vehicle = TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.TOP.VALUE

        else if _vehicle is '냉탑'
          vehicle = TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.FREEZER.VALUE

    else # 퀵인 경우
      if _vehicle is '오토바이'
        weight = TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE

      else if _vehicle is '다마스'
        weight = TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.DAMAS.VALUE

      else if _vehicle is '라보'
        weight = TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.LABOR.VALUE

      else if _vehicle is '밴'
        weight = TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.BEN.VALUE

    [vehicle, weight]

  @logout: (callback) =>
    OneSignal.sendTag 'id', ''

    Meteor.logout callback

  @getCount: =>
    state.count

  @alert: (content, onConfirm = =>) =>
    Alert.alert null, content, [
      text: '확인'
      onPress: onConfirm
    ]

  @confirm: (content, onConfirm = =>, onCancel = =>) =>
    Alert.alert null, content, [
      text: '취소'
      onPress: onCancel
    ,
      text: '확인',
      onPress: onConfirm
    ]

  @getFormattedPrice: (amount) =>
    parseInt(amount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

  @getFormattedDate: (date) =>
    if moment().diff(moment(date), 'days') < 5
      return moment(date).fromNow()

    else
      return moment(date).format('YYYY-MM-DD HH:mm')

  @getAge: (birthYear) =>
    moment().year() - parseInt(birthYear) + 1

  @createUser: (option, callback) =>
    Accounts.createUser option, (error) =>
      if error
        if error.reason is 'Email already exists.'
          error.reason = '이미 존재하는 이메일입니다.'

      callback error

  @login: (email, password, callback) =>
    Meteor.loginWithPassword email, password, (error) =>
      if error
        if error.reason is 'User not found'
          error.reason = '존재하지 않는 이메일입니다.'

        else if error.reason is 'Incorrect password'
          error.reason = '비밀번호가 틀립니다.'

        callback error, Meteor.user()

        return

      OneSignal.sendTag 'id', Meteor.userId()

      callback null, Meteor.user()

  @go: (routeName, param) =>
    stackNavigation.navigate routeName, param

  @og: (routeName, param) =>
    tabNavigation.navigate routeName, param

  @back: =>
    stackNavigation.back()

  @reset: (routeName, param) =>
    stackNavigation.reset routeName, param

  @replace: (routeName, param) =>
    stackNavigation.replace routeName, param

  @goToInitialScreen: (user) =>
    if not user._id
      Util.reset 'SignupInfo'

    else
      Util.reset 'Main'
