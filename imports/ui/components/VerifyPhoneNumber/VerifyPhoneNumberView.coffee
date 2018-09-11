export default observer class VerifyPhoneNumberView extends Component
  onPressSendSecretNumber: =>
    @props.onPressSendSecretNumber()

  onPressConfirmSecretNumber: =>
    @props.onPressConfirmSecretNumber()

  render: =>
    <View>
      <Error error={@props.validation.phoneNumber.error}>
        <View>
          <Input maxLength={11} type="number" placeholder="휴대폰번호" state={@props.cState} path="phoneNumber" />
          <View style={{ position: 'absolute', right: 0, top: 4 }}>
            <Button textSize={14} height={35} color="light blue invert" onPress={@onPressSendSecretNumber}>인증번호 전송</Button>
          </View>
        </View>
      </Error>
      <Error error={@props.cState.secretNumberError}>
        <View>
          <Input type="number" placeholder="인증번호" state={@props.cState} path="secretNumber" />
          <View style={{ position: 'absolute', right: 0, top: 4 }}>
            <Button textSize={14} height={35} color="light blue invert" onPress={@onPressConfirmSecretNumber}>인증번호 확인</Button>
          </View>
        </View>
      </Error>
    </View>
