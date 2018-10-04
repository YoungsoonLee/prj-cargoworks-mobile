export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSend: =>
      Meteor.call 'findId', @props.state.phoneNumber, (error, id) =>
        if error
          Util.alert error.reason

          return

        if isProduction
          Util.alert '해당 번호로 아이디를 전송했습니다'

        else
          Util.alert "[카고웍스] 아이디는 #{id}입니다 (디버깅 모드)"


    render: =>
      <WrappedComponent {...@props} onPressSend={@onPressSend} />
