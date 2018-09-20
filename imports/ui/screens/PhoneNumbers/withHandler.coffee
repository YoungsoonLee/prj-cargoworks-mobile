import { Alert } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    addPhoneNumber: =>
      mobileNumbersDefaultObject = _.cloneDeep @props.mobileNumbersDefaultObject

      mobileNumbersDefaultObject.number = @props.state.phoneNumber
      mobileNumbersDefaultObject.isVerified = true
      mobileNumbersDefaultObject.isPrimary = false
      mobileNumbersDefaultObject.isTakenOverByOthers = false

      @props.state.phoneNumbers.push mobileNumbersDefaultObject

      Util.alert '추가되었습니다.'

    onPressDelete: (index) =>
      @props.state.phoneNumbers.splice index, 1

    onChangeCheckbox: (isChecked, name) =>
      @props.state.phoneNumbers.forEach (phoneNumber) =>
        phoneNumber.isPrimary = false

      @props.state.phoneNumbers[name].isPrimary = isChecked

    onPressSave: =>
      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $set:
          mobileNumbers: toJs @props.state.phoneNumbers
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.back()

        Util.alert '저장되었습니다.'

    onVerify: =>
      phoneNumber = @props.state.phoneNumbers.find (_phoneNumber) =>
        _phoneNumber.number is @props.state.phoneNumber

      if phoneNumber
        Util.alert '이미 추가된 핸드폰번호 입니다.'

        return

      Meteor.call 'transporters.findOne',
        _id:
          $ne: @props.transporter._id
        'mobileNumbers.number': @props.state.phoneNumber
      , (error, transporter) =>
        if error
          Util.alert error.reason

          return

        if transporter
          mobileNumber = transporter.mobileNumbers.find (mobileNumber) =>
            mobileNumber.number is @props.state.phoneNumber and not mobileNumber.isTakenOverByOthers

          if mobileNumber
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

          else
            @addPhoneNumber()

        else
          @addPhoneNumber()

    render: =>
      <WrappedComponent {...@props} onPressSave={@onPressSave} onVerify={@onVerify} onChangeCheckbox={@onChangeCheckbox} onPressDelete={@onPressDelete} />
