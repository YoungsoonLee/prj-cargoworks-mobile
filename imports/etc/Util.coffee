import { NavigationActions } from 'react-navigation'
import stackNavigation from './stack_navigation.coffee'
import { Alert } from 'react-native'
import { Accounts } from 'react-native-meteor'
import OneSignal from 'react-native-onesignal'

export default class Util
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
      Util.reset 'UpdateInsurance'
