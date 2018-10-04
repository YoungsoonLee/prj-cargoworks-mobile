export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSend: =>
      Meteor.call 'sendTempPassword', @props.state.id, @props.state.phoneNumber, (error, tempPassword) =>
        if error
          Util.alert error.reason

          return

        if isProduction
          Util.alert '해당 번호로 임시 비밀번호를 전송했습니다'

        else
          Util.alert "[카고웍스] 임시 비밀번호는 #{tempPassword}입니다"


    render: =>
      <WrappedComponent {...@props} onPressSend={@onPressSend} />
