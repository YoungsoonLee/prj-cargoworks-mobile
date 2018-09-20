import { Alert } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    addPhoneNumber: =>
      mobileNumbersDefaultObject = _.cloneDeep @props.mobileNumbersDefaultObject

      mobileNumbersDefaultObject.number = @props.state.phoneNumber
      mobileNumbersDefaultObject.isVerified = true
      mobileNumbersDefaultObject.isPrimary = false
      mobileNumbersDefaultObject.isTakenOverByOthers = false

      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $push:
          mobileNumbers: mobileNumbersDefaultObject
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.alert '추가되었습니다.'

    onVerify: =>
      mobileNumber = @props.transporter.mobileNumbers.find (mobileNumber) =>
        mobileNumber.number is @props.state.phoneNumber

      if mobileNumber
        Util.alert '이미 추가된 핸드폰번호 입니다.'

        return

      Meteor.call 'transporters.findOne',
        'mobileNumbers.number': @props.state.phoneNumber
      , (error, transporter) =>
        if error
          Util.alert error.reason

          return

        if transporter
          Alert.alert null, '''
            이미 가입된 휴대폰번호 입니다.
            계속 진행하시겠습니까?
          ''', [
              text: '계속진행'
              onPress: =>
                Meteor.call 'transporters.update',
                  _id: transporter._id
                  'mobileNumbers.number': @props.state.phoneNumber
                ,
                  $set:
                    'mobileNumbers.$.isTakenOverByOthers': true
                , (error) =>
                  if error
                    Util.alert error.reason

                    return

                  @addPhoneNumber()
            ,
              text: '취소'
            ]
          ,
            cancelable: false

    render: =>
      <WrappedComponent {...@props} onVerify={@onVerify} />
