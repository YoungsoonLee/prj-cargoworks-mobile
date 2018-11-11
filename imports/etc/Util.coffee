import stackNavigation from './stack_navigation.coffee'
import tabNavigation from './tab_navigation.coffee'
import { Alert } from 'react-native'
import { Accounts } from 'react-native-meteor'
import OneSignal from 'react-native-onesignal'
import geolib from 'geolib'

export default observer class Util extends Component
  @getAgentFare: (order) =>
    if order.agentFare.isExpress
      return order.agentFare.express

    else if order.agentFare.isMixedFreight
      return order.agentFare.mixedFreight

    else if order.agentFare.isSameDayDelivery
      return order.agentFare.sameDayDelivery

    else
      return order.agentFare.transporter

  @getPartialAddress: (depth, address, sido, sigungu, startSido, startAddress) =>
    if /서울|부산|대구|인천|광주|대전|울산/.test sido
      addr1 = sido + '시'

    else if sido is '제주특별자치도'
      addr1 = '제주'

    else if sido is '세종특별자치시'
      addr1 = '세종'

    else
      addr1 = sido

    addr2 = sigungu.replace /\s.+구/, ''

    regExp = new RegExp "#{sido} #{sigungu} (.+[읍면동]) "

    exec = regExp.exec address

    if not exec
      regExp = new RegExp "#{sido} #{sigungu} (.+[읍면동])[0-9]"

      exec = regExp.exec address

    if exec
      addr3 = exec?[1]

    else
      addr3 = ''

    exec = /(.+리) /.exec address

    if exec
      addr4 = exec?[1]

    else
      exec = /(.+통 .+반) /.exec address

      if exec
        addr4 = exec?[1]

      else
        addr4 = ''

    if depth is 1
      return addr1

    else if depth is 2
      return addr2

    else if depth is 3
      return addr3

    else if depth is 4
      return addr4

  # type은 'PARCEL', 'FREIGHT' 중 하나
  # address는 지번 주소(띄어쓰기가 되어 있어야 한다)
  # sido는 1단 주소
  # sigungu는 2단 주소
  # 3단 주소는 이 함수에서 생성한다
  # endSido는 도착지의 주소일 경우만 넣는다. 출발지의 시도를 넣어줘야 한다.(daum에 있음)
  # startAddress 도착지의 주소일 경우만 넣는다. 출발지의 지번주소를 넣어줘야 한다.
  @getShortAddress: (type, isStart, address, sido, sigungu, startSido, startAddress) =>
    addr1 = @getPartialAddress 1, address, sido, sigungu, startSido, startAddress
    addr2 = @getPartialAddress 2, address, sido, sigungu, startSido, startAddress
    addr3 = @getPartialAddress 3, address, sido, sigungu, startSido, startAddress
    addr4 = @getPartialAddress 4, address, sido, sigungu, startSido, startAddress

    if /서울|부산|대구|인천|광주|대전|울산/.test startSido
      startAddr1 = startSido + '시'

    else if startSido is '제주특별자치도'
      startAddr1 = '제주'

    else if startSido is '세종특별자치시'
      startAddr1 = '세종'

    else
      startAddr1 = startSido

    exec = /(.+리) /.exec startAddress

    if exec
      startAddr4 = exec?[1]

    else
      exec = /(.+통 .+반) /.exec startAddress

      if exec
        startAddr4 = exec?[1]

      else
        startAddr4 = ''

    # console.log 'addr1', addr1
    # console.log 'addr2', addr2
    # console.log 'addr3', addr3
    # console.log 'addr4', addr4

    if type is 'PARCEL'
      # 줄이고자 하는 주소가 출발지인 경우
      if isStart
        if /.+동$/.test addr3 # addr3이 동인 경우
          return addr3

        else # addr3이 동이 아닌 경우
          if /.+군$/.test addr2
            exec = /(.+)군$/.exec addr2

            return "#{exec?[1]} #{addr4}"

          else
            exec = /(.+)시$/.exec addr2

            return "#{exec?[1]} #{addr4}"

      # 도착지인 경우
      else
        if addr1 is startAddr1 # 출발지와 도착지의 addr1이 같은 경우
          if /.+동$/.test addr3 # addr3이 동인 경우
            if /서울|부산|대구|인천|광주|대전|울산/.test addr1 # addr1이 서울 또는 광역시일 경우
              return addr3

            else
              exec = /(.+)시$/.exec addr2

              return "#{exec?[1]} #{addr3}"

          else # addr3이 동이 아닌 경우
            if /.+군$/.test addr2
              exec = /(.+)군$/.exec addr2

              return "#{exec?[1]} #{addr4}"

            else
              exec = /(.+)시$/.exec addr2

              return "#{exec?[1]} #{addr4}"

        else # 출발지와 도착지의 addr1이 같지 않은 경우
          if /.+동$/.test addr3 # addr3이 동인 경우
            if /서울|부산|대구|인천|광주|대전|울산/.test addr1 # addr1이 서울 또는 광역시일 경우
              exec = /(.+)시$/.exec addr1

              return "#{exec?[1]} #{addr3}"

            else
              exec = /(.+)시$/.exec addr2

              return "#{exec?[1]} #{addr3}"


          else # addr3이 동이 아닌 경우
            if /.+군$/.test addr2
              # 출발지와 도착지의 addr1이 광역시인 경우
              if /부산|대구|인천|광주|대전|울산/.test(addr1) and /부산|대구|인천|광주|대전|울산/.test(startAddr1)
                exec = /(.+)시$/.exec addr1

                return "#{exec?[1]} #{addr3}"

              else
                exec = /(.+)시$/.exec addr2

                return "#{exec?[1]} #{addr3}"

            else
              exec = /(.+)시$/.exec addr2

              return "#{exec?[1]} #{addr4}"

    else if type is 'FREIGHT'
      # 줄이고자 하는 주소가 출발지인 경우
      if isStart
        if /.+동$/.test addr3 # addr3이 동인 경우
          if /서울|부산|대구|인천|광주|대전|울산/.test addr1 # addr1이 서울 또는 광역시일 경우
            exec = /(.+)시$/.exec addr1

            return "#{exec?[1]} #{addr3}"

          else
            exec = /(.+)시$/.exec addr2

            return "#{exec?[1]} #{addr3}"

        else
          if /부산|대구|인천|광주|대전|울산/.test addr1
            exec = /(.+)군$/.exec addr2

            return "#{exec?[1]} #{addr4}"

          else
            if /.+군$/.test addr2
              exec = /(.+)군$/.exec addr2

              return "#{exec?[1]} #{addr4}"

            else
              exec = /(.+)시$/.exec addr2

              return "#{exec?[1]} #{addr4}"

      # 도착지인 경우
      else
        if /.+동$/.test addr3 # addr3이 동인 경우
          if /서울|부산|대구|인천|광주|대전|울산/.test addr1 # addr1이 서울 또는 광역시일 경우
            exec = /(.+)시$/.exec addr1

            return "#{exec?[1]} #{addr3}"

          else
            return "#{addr1} #{addr2}"

        else
          if /부산|대구|인천|광주|대전|울산/.test addr1
            exec = /(.+)시$/.exec addr1

            return "#{exec?[1]} #{addr2}"

          else
            if /.+군$/.test addr2
              if addr1 is startAddr1 and /.+리$/.test startAddr4
                exec = /(.+)군$/.exec addr2

                return "#{exec?[1]} #{addr4}"

              else
                return "#{addr1} #{addr2}"

            else
              return "#{addr1} #{addr2}"

  @getCount: =>
    state.count

  @getVehicleConstantFromVehicle: (vehicle, RECRUITMENTS) =>
    if vehicle is '오토바이'
      vehicleConstant = RECRUITMENTS.VEHICLES.PARCEL_MOTOR_BIKE.VALUE

    else if vehicle is '다마스'
      vehicleConstant = RECRUITMENTS.VEHICLES.PARCEL_DAMAS.VALUE

    else if vehicle is '라보'
      vehicleConstant = RECRUITMENTS.VEHICLES.PARCEL_LABOR.VALUE

    else if vehicle is '밴'
      vehicleConstant = RECRUITMENTS.VEHICLES.PARCEL_BEN.VALUE

    else if vehicle is '1톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ONE_CARGO.VALUE

    else if vehicle is '1톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ONE_TOP.VALUE

    else if vehicle is '1톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ONE_FREEZER.VALUE

    else if vehicle is '1.4톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ONE_FOUR_CARGO.VALUE

    else if vehicle is '1.4톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ONE_FOUR_TOP.VALUE

    else if vehicle is '1.4톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ONE_FOUR_FREEZER.VALUE

    else if vehicle is '2.5톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TWO_FIVE_CARGO.VALUE

    else if vehicle is '2.5톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TWO_FIVE_TOP.VALUE

    else if vehicle is '2.5톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TWO_FIVE_FREEZER.VALUE

    else if vehicle is '3.5톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_THREE_FIVE_CARGO.VALUE

    else if vehicle is '3.5톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_THREE_FIVE_TOP.VALUE

    else if vehicle is '3.5톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_THREE_FIVE_FREEZER.VALUE

    else if vehicle is '5톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_FIVE_CARGO.VALUE

    else if vehicle is '5톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_FIVE_TOP.VALUE

    else if vehicle is '5톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_FIVE_FREEZER.VALUE

    else if vehicle is '5톤축 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_FIVE_LONG_CARGO.VALUE

    else if vehicle is '5톤축 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_FIVE_LONG_TOP.VALUE

    else if vehicle is '5톤축 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_FIVE_LONG_FREEZER.VALUE

    else if vehicle is '8톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_EIGHT_CARGO.VALUE

    else if vehicle is '8톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_EIGHT_TOP.VALUE

    else if vehicle is '8톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_EIGHT_FREEZER.VALUE

    else if vehicle is '11톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ELEVEN_CARGO.VALUE

    else if vehicle is '11톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ELEVEN_TOP.VALUE

    else if vehicle is '11톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_ELEVEN_FREEZER.VALUE

    else if vehicle is '18톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_EIGHTTEEN_CARGO.VALUE

    else if vehicle is '18톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_EIGHTTEEN_TOP.VALUE

    else if vehicle is '18톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_EIGHTTEEN_FREEZER.VALUE

    else if vehicle is '25톤 카고'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TWENTYFIVE_CARGO.VALUE

    else if vehicle is '25톤 탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TWENTYFIVE_TOP.VALUE

    else if vehicle is '25톤 냉탑'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TWENTYFIVE_FREEZER.VALUE

    else if vehicle is '추레라'
      vehicleConstant = RECRUITMENTS.VEHICLES.FREIGHT_TRAILER.VALUE

    vehicleConstant

  @getVehicleFromConstant: (vehicleConstant, RECRUITMENTS) =>
    if vehicleConstant is RECRUITMENTS.VEHICLES.PARCEL_MOTOR_BIKE.VALUE
      vehicle = '오토바이'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.PARCEL_DAMAS.VALUE
      vehicle = '다마스'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.PARCEL_LABOR.VALUE
      vehicle = '라보'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.PARCEL_BEN.VALUE
      vehicle = '밴'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ONE_CARGO.VALUE
      vehicle = '1톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ONE_TOP.VALUE
      vehicle = '1톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ONE_FREEZER.VALUE
      vehicle = '1톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ONE_FOUR_CARGO.VALUE
      vehicle = '1.4톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ONE_FOUR_TOP.VALUE
      vehicle = '1.4톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ONE_FOUR_FREEZER.VALUE
      vehicle = '1.4톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TWO_FIVE_CARGO.VALUE
      vehicle = '2.5톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TWO_FIVE_TOP.VALUE
      vehicle = '2.5톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TWO_FIVE_FREEZER.VALUE
      vehicle = '2.5톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_THREE_FIVE_CARGO.VALUE
      vehicle = '3.5톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_THREE_FIVE_TOP.VALUE
      vehicle = '3.5톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_THREE_FIVE_FREEZER.VALUE
      vehicle = '3.5톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_FIVE_CARGO.VALUE
      vehicle = '5톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_FIVE_TOP.VALUE
      vehicle = '5톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_FIVE_FREEZER.VALUE
      vehicle = '5톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_FIVE_LONG_CARGO.VALUE
      vehicle = '5톤축 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_FIVE_LONG_TOP.VALUE
      vehicle = '5톤축 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_FIVE_LONG_FREEZER.VALUE
      vehicle = '5톤축 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_EIGHT_CARGO.VALUE
      vehicle = '8톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_EIGHT_TOP.VALUE
      vehicle = '8톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_EIGHT_FREEZER.VALUE
      vehicle = '8톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ELEVEN_CARGO.VALUE
      vehicle = '11톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ELEVEN_TOP.VALUE
      vehicle = '11톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_ELEVEN_FREEZER.VALUE
      vehicle = '11톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_EIGHTTEEN_CARGO.VALUE
      vehicle = '18톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_EIGHTTEEN_TOP.VALUE
      vehicle = '18톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_EIGHTTEEN_FREEZER.VALUE
      vehicle = '18톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TWENTYFIVE_CARGO.VALUE
      vehicle = '25톤 카고'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TWENTYFIVE_TOP.VALUE
      vehicle = '25톤 탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TWENTYFIVE_FREEZER.VALUE
      vehicle = '25톤 냉탑'

    else if vehicleConstant is RECRUITMENTS.VEHICLES.FREIGHT_TRAILER.VALUE
      vehicle = '추레라'

    vehicle

  @getVehicleType = (orderOrTransporter, TRANSPORTERS) ->
    vehicleType =
      if orderOrTransporter.vehicleType is TRANSPORTERS.VEHICLES.PARCEL.VALUE
        if orderOrTransporter.vehicleWeightCapacity is TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE
          "#{orderOrTransporter.vehicleType}_#{orderOrTransporter.vehicleWeightCapacity}"
        else
          "PARCEL_NON_MOTOR_BIKE"
      else
        if orderOrTransporter.vehicleWeightCapacity is TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.VALUE
          "#{orderOrTransporter.vehicleType}_#{orderOrTransporter.vehicleWeightCapacity}"
        else
          "#{orderOrTransporter.vehicleType}_#{orderOrTransporter.vehicleWeightCapacity}_#{orderOrTransporter.freightBoxType}"

    # console.log 'vehicleType: ', vehicleType
    return vehicleType

  @getDistance: (fromLongitude, fromLatitude, toLongitude, toLatitude) =>
    distance = geolib.getDistance
      longitude: fromLongitude
      latitude: fromLatitude
    ,
      longitude: toLongitude
      latitude: toLatitude

    distance

  @getShortPickUpScheduledAt: (_pickUpScheduledAt) =>
    pickUpScheduledAt = moment _pickUpScheduledAt

    date = ''

    if pickUpScheduledAt.format('YYYY-MM') is moment().format('YYYY-MM')
      if pickUpScheduledAt.format('DD') is moment().format('DD')
        date = '오늘'

      else if pickUpScheduledAt.date() is moment().date() + 1
        date = '내일'

      else
        date = pickUpScheduledAt.format('MM/DD')

    else
      date = pickUpScheduledAt.format('MM/DD')

    time = pickUpScheduledAt.format('A h:mm')

    "#{date} #{time}"

  @getShortDischargeScheduleAt: (dischargeScheduleAt) =>
    moment(dischargeScheduleAt).format('MM/DD A h:mm')

  @getShortVehicleType: (vehicleWeightCapacity, freightBoxType, TRANSPORTERS) =>
    WEIGHTS = TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS

    BOX_TYPES = TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES

    if vehicleWeightCapacity in [WEIGHTS.MOTOR_BIKE.VALUE, WEIGHTS.LABOR.VALUE, WEIGHTS.DAMAS.VALUE, WEIGHTS.BEN.VALUE]
      if vehicleWeightCapacity is WEIGHTS.MOTOR_BIKE.VALUE
        return '오'

      else if vehicleWeightCapacity is WEIGHTS.LABOR.VALUE
        return '라'

      else if vehicleWeightCapacity is WEIGHTS.DAMAS.VALUE
        return '다'

      else if vehicleWeightCapacity is WEIGHTS.BEN.VALUE
        return '밴'

    else if freightBoxType in [BOX_TYPES.CARGO.VALUE, BOX_TYPES.TOP.VALUE, BOX_TYPES.FREEZER.VALUE]
      if vehicleWeightCapacity is TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.VALUE
        return ''

      if freightBoxType is BOX_TYPES.CARGO.VALUE
        return '카'

      else if freightBoxType is BOX_TYPES.TOP.VALUE
        return '탑'

      else if freightBoxType is BOX_TYPES.FREEZER.VALUE
        return '냉탑'

    ''

  @getShortWeight: (vehicleWeightCapacity, freightBoxType, TRANSPORTERS) =>
    WEIGHTS = TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS

    if vehicleWeightCapacity is WEIGHTS.ONE.VALUE
      return '1'

    else if vehicleWeightCapacity is WEIGHTS.ONE_FOUR.VALUE
      return '1.4'

    else if vehicleWeightCapacity is WEIGHTS.TWO_FIVE.VALUE
      return '2.5'

    else if vehicleWeightCapacity is WEIGHTS.THREE_FIVE.VALUE
      return '3.5'

    else if vehicleWeightCapacity is WEIGHTS.FIVE.VALUE
      return '5'

    else if vehicleWeightCapacity is WEIGHTS.FIVE_LONG.VALUE
      return '5축'

    else if vehicleWeightCapacity is WEIGHTS.EIGHT.VALUE
      return '8'

    else if vehicleWeightCapacity is WEIGHTS.ELEVEN.VALUE
      return '11'

    else if vehicleWeightCapacity is WEIGHTS.EIGHTTEEN.VALUE
      return '18'

    else if vehicleWeightCapacity is WEIGHTS.TWENTYFIVE.VALUE
      return '25'

    else if vehicleWeightCapacity is WEIGHTS.TRAILER.VALUE
      return '추'

    ''

  @getShortPrice: (price, fiexed = 1) =>
    (price / 1000).toFixed(fiexed)

  @convertMetersToKilos: (meters, fiexed = 1) =>
    (meters / 1000).toFixed(fiexed)

  @convertSecondsToHoursAndMinutes: (seconds) =>
    hour = parseInt(seconds / 3600)

    min = parseInt((seconds % 3600) / 60)

    if hour > 0
      return "#{hour}시간 #{min}분"

    else
      return "#{min}분"

  @get: (state, path) =>
    if not state or not path
      return null

    value = null

    eval "value = state.#{path}"

    value

  @set: (state, path, value) =>
    if not state or not path
      return null

    eval "state.#{path} = value"

  @push: (state, path, value) =>
    eval "state.#{path}.push(value)"

  @unshift: (state, path, value) =>
    eval "state.#{path}.unshift(value)"

  @splice: (state, path, startIndex, endIndex) =>
    eval "state.#{path}.splice(startIndex, endIndex)"

  @getVehicle: (_weight, _vehicle, TRANSPORTERS) =>
    WEIGHT = _.find TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
      WEIGHT.VALUE is _weight

    if WEIGHT # 퀵인 경우
      vehicle = WEIGHT.TEXT

    else # 화물인 경우
      if _weight is TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.VALUE # 추레라인 경우
        vehicle = TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.TEXT

      else
        if not _weight or not _vehicle
          return

        WEIGHT = _.find TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS, (WEIGHT) =>
          WEIGHT.VALUE is _weight

        if WEIGHT.TEXT is '5톤 축'
          weight = '5톤축'

        else
          weight = WEIGHT.TEXT

        BOX_TYPE = _.find TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES, (BOX_TYPE) =>
          BOX_TYPE.VALUE is _vehicle

        if BOX_TYPE.VALUE is 'FREEZER'
          BOX_TYPE.TEXT = '냉탑'

        boxType = BOX_TYPE.TEXT

        vehicle = "#{weight} #{boxType}"

    vehicle

  @getVehicleWeight: (_vehicle, TRANSPORTERS) =>
    vehicle = ''

    weight = ''

    if /[0-9]|추레라/.test _vehicle # 화물인 경우
      if /추레라/.test _vehicle # 추레라인 경우
        weight = TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS.TRAILER.VALUE

      else # 톤수가 있는 경우
        exec = /(.+톤.*) (.+)/.exec _vehicle

        _weight = exec[1]

        _vehicle = exec[2]

        WEIGHT = _.find TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS, (WEIGHT) =>
          if _weight is '5톤축'
            return WEIGHT.TEXT is '5톤 축'

          else
            return WEIGHT.TEXT is _weight

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

  @logout: (callback) =>
    OneSignal.sendTag 'id', ''

    Meteor.logout callback

  @login: (email, password, callback) =>
    Meteor.loginWithPassword email, password, (error) =>
      if error
        if error.reason is 'User not found'
          error.reason = '존재하지 않는 아이디입니다.'

        else if error.reason is 'Incorrect password'
          error.reason = '비밀번호가 틀립니다.'

        callback error

        return

      user = Meteor.user()

      if not user
        error =
          reason: '로그인에 실패했습니다.'

        @logout (_error) =>
          if _error
            callback _error

            return

          callback error

      Meteor.call 'users.update',
        _id: user._id
      ,
        $set:
          'profile.appState': 'active'
      , (error) =>
        if error
          callback error

          return

        OneSignal.sendTag 'id', user._id

        callback error, user

  @getFormattedPrice: (amount) =>
    parseInt(amount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')

  @getFormattedDate: (date) =>
    if moment().diff(moment(date), 'days') < 5
      return moment(date).fromNow()

    else
      return moment(date).format('YYYY-MM-DD HH:mm')

  @createUser: (option, callback) =>
    Accounts.createUser option, (error) =>
      if error
        if error.reason is 'Email already exists.'
          error.reason = '이미 존재하는 이메일입니다.'

      callback error

  @signout: (callback) =>
    user = Meteor.user()

    if not user
      return

    OneSignal.sendTag 'id', ''

    Meteor.call 'users.update',
      _id: user._id
    ,
      $set:
        # 'profile.isDeleted': true
        'profile.isDroppedOut': true
        'username': Meteor.user().username + "_deleted"
    , (error) =>
      if error
        callback error

        return

      Meteor.call 'transporters.update',
        _id: user.profile.transporterId
      ,
        $set:
          isDeleted: true
      , (error) =>
        if error
          callback error

          return

        callback()

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

  @goToInitialScreen: (user, transporter, TRANSPORTERS) =>
    if not user._id
      Util.reset 'SignupInfo'

    else if transporter.adminApprovalStatus is TRANSPORTERS.ADMIN_APPROVAL_STATUS.IN_PROGRESS.VALUE
      Util.reset 'UpdateVehicle'

    else if transporter.adminApprovalStatus in [TRANSPORTERS.ADMIN_APPROVAL_STATUS.REQUESTED.VALUE, TRANSPORTERS.ADMIN_APPROVAL_STATUS.UPDATE_REQUESTED.VALUE]
      Util.reset 'Pending'

    else
      Util.reset 'Main'
