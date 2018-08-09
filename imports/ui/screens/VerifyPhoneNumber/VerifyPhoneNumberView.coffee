export default observer class VerifyPhoneNumberView extends Component
  constructor: (props) ->
    super props

    @state = observable
      value:
        name: ''
        phoneNumber: ''
        isPhoneNumberMain: false
      secretNumber: ''

    reaction(
      =>
        JSON.stringify @state.value
    ,
      =>
        state.verifyPhoneNumberValue = @state.value
    )

  onChangeInput: (value, isValid, name) =>
    @state.value[name] = value

    @props.validation[name] = isValid

  onChangeSecretNumber: (value) =>
    @state.secretNumber = value

  onChangeCheckbox: (isChecked, name) =>
    @state.value[name] = isChecked

  onPressNex: =>
    Util.go 'Terms'

  render: =>
    <Layout title="휴대폰 인증">
      <View style={{ flex: 1, padding: 20 }}>
        <View style={{ alignItems: 'center' }}>
          <Image source={require '../../../../images/phone.png'} style={{ width: 50, height: 74 }} />
        </View>
        <Text center size={18} bold marginTop={30}>휴대폰번호를 인증하세요</Text>
        <Input isRequired placeholder="이름" marginTop={10} onChange={@onChangeInput} name="name" value={@state.value.name} />
        <View style={{ marginTop: 10 }}>
          <Input isRequired placeholder="휴대폰번호" onChange={@onChangeInput} name="phoneNumber" value={@state.value.phoneNumber} />
          <View style={{ position: 'absolute', right: 0, top: 4 }}>
            <Button textSize={14} height={35} color="light blue invert">인증번호 전송</Button>
          </View>
        </View>
        <View style={{ marginTop: 10 }}>
          <Input placeholder="인증번호" onChange={@onChangeSecretNumber} value={@state.secretNumber} />
          <View style={{ position: 'absolute', right: 0, top: 4 }}>
            <Button textSize={14} height={35} color="light blue invert">인증번호 확인</Button>
          </View>
        </View>
        <Checkbox onChange={@onChangeCheckbox} name="isPhoneNumberMain" isChecked={@state.value.isPhoneNumberMain} label={<Text>이 번호를 내 대표 연락처로 설정합니다.</Text>} marginTop={20} />
      </View>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNex}>다음</Button>
    </Layout>
