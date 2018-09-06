export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.phoneNumber
      ,
        =>
          @props.state.secretNumber = ''
          @props.state.internalSecretNumber = ''
          @props.state.isSecretNumberValid = false
          @props.state.secretNumberError = ''
      )

      reaction(
        =>
          @props.state.isSecretNumberValid
      ,
        =>
          pState = @props.pState

          path = @props.path

          state = @props.state

          if @props.state.isSecretNumberValid
            eval "pState.#{path} = state.phoneNumber"

          else
            eval "pState.#{path} = ''"
      )

    onPressSendSecretNumber: =>
      @props.state.internalSecretNumber = _.random(1000, 9999).toString()

      if isProduction
        Meteor.call 'sendSms', @props.state.phoneNumber, "[카고웍스] 인증번호는 #{@props.state.internalSecretNumber} 입니다.", (error) =>
          if error
            Util.alert error.reason

            return

          Util.alert '인증번호를 전송했습니다.'

      else
        Util.alert "[카고웍스] 인증번호는 #{@props.state.internalSecretNumber} 입니다."

    onPressConfirmSecretNumber: =>
      if @props.state.secretNumber isnt @props.state.internalSecretNumber
        @props.state.secretNumberError = '인증번호가 일치하지 않습니다.'

        @props.state.isSecretNumberValid = false

      else
        @props.state.secretNumberError = ''

        @props.state.isSecretNumberValid = true

        Util.alert '인증되었습니다.'

    render: =>
      <WrappedComponent {...@props} onPressSendSecretNumber={@onPressSendSecretNumber} onPressConfirmSecretNumber={@onPressConfirmSecretNumber} />
