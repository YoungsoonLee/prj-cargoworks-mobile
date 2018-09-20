export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.cState.phoneNumber
      ,
        =>
          @props.cState.secretNumber = ''
          @props.cState.internalSecretNumber = ''
          @props.cState.isSecretNumberValid = false
          @props.cState.secretNumberError = ''
      )

      reaction(
        =>
          @props.cState.isSecretNumberValid
      ,
        =>
          if @props.cState.isSecretNumberValid
            _set @props.state, @props.path, @props.cState.phoneNumber

          else
            _set @props.state, @props.path, ''
      )

    onPressSendSecretNumber: =>
      @props.cState.internalSecretNumber = _.random(1000, 9999).toString()

      if isProduction
        Meteor.call 'sendSms', @props.cState.phoneNumber, "[카고웍스] 인증번호는 #{@props.cState.internalSecretNumber} 입니다.", (error) =>
          if error
            Util.alert error.reason

            return

          Util.alert '인증번호를 전송했습니다.'

      else
        Util.alert "[카고웍스] 인증번호는 #{@props.cState.internalSecretNumber} 입니다."

    onPressConfirmSecretNumber: =>
      if @props.cState.secretNumber isnt @props.cState.internalSecretNumber
        @props.cState.secretNumberError = '인증번호가 일치하지 않습니다.'

        @props.cState.isSecretNumberValid = false

      else
        @props.cState.secretNumberError = ''

        @props.cState.isSecretNumberValid = true

        Util.alert '인증되었습니다.', =>
          if @props.onVerify
            @props.onVerify()

    render: =>
      <WrappedComponent {...@props} onPressSendSecretNumber={@onPressSendSecretNumber} onPressConfirmSecretNumber={@onPressConfirmSecretNumber} />
