import { Alert } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      Meteor.call 'transporters.findOne',
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
              로그인 하시겠습니까?
            ''', [
                text: '계속가입'
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

                    Util.go 'Terms'
              ,
                text: '로그인'
                onPress: =>
                  Util.go 'Login'
              ]
            ,
              cancelable: false

          else
            Util.go 'Terms'

        else
          Util.go 'Terms'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
