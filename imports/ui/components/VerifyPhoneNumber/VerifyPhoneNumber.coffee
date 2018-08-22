export default observer class VerifyPhoneNumber extends Component
  constructor: (props) ->
    super props

    @state = observable
      phoneNumber: ''
      secretNumber: ''
      internalSecretNumber: ''
      isValid: false

    reaction(
      =>
        @state.phoneNumber + @state.isValid
    ,
      =>
        @props.onChange @state.phoneNumber, @state.isValid
    )

  onPressSendSecretNumber: =>
    @state.internalSecretNumber = _.random(1000, 9999).toString()

    if not isProduction
      Util.alert "[카고웍스] 인증번호는 #{@state.internalSecretNumber} 입니다."

    else
      Meteor.call 'sendSms', @state.phoneNumber, "[카고웍스] 인증번호는 #{@state.internalSecretNumber} 입니다.", (error) =>
        if error
          Util.alert error.reason

          return

        Util.alert '인증번호를 전송했습니다.'

  onPressConfirmSecretNumber: =>
    if @state.internalSecretNumber is @state.secretNumber
      @state.isValid = true

      Util.alert '인증에 성공했습니다.'

    else
      @state.isValid = false

      Util.alert '인증번호가 일치하지 않습니다.'

  onChangeInput: (value, isValid, name) =>
    @state[name] = value

  render: =>
    <View>
      <View>
        <Input isRequired placeholder="휴대폰번호" onChange={@onChangeInput} name="phoneNumber" value={@state.phoneNumber} />
        <View style={{ position: 'absolute', right: 0, top: 4 }}>
          <Button textSize={14} height={35} color="light blue invert" onPress={@onPressSendSecretNumber}>인증번호 전송</Button>
        </View>
      </View>
      <View style={{ marginTop: 10 }}>
        <Input placeholder="인증번호" onChange={@onChangeInput} name="secretNumber" value={@state.secretNumber} />
        <View style={{ position: 'absolute', right: 0, top: 4 }}>
          <Button textSize={14} height={35} color="light blue invert" onPress={@onPressConfirmSecretNumber}>인증번호 확인</Button>
        </View>
      </View>
    </View>
