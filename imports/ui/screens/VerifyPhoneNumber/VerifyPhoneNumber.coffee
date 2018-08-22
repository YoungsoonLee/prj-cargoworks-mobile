import VerifyPhoneNumber from '../../components/VerifyPhoneNumber/VerifyPhoneNumber.coffee'

export default observer class _VerifyPhoneNumber extends Component
  constructor: (props) ->
    super props

    @state = observable
      value:
        name: ''
        phoneNumber: ''
        isPhoneNumberMain: false
      isPhoneNumberValid: false
      isValid: false

    reaction(
      =>
        JSON.stringify @state.value
    ,
      =>
        state.verifyPhoneNumberValue = @state.value
    )

    reaction(
      =>
        @validate()
    ,
      =>
        @state.isValid = @validate()
    )

  onChangeInput: (value, isValid, name) =>
    @state.value[name] = value

  onChangeCheckbox: (isChecked, name) =>
    @state.value[name] = isChecked

  onPressNext: =>
    Util.go 'Terms'

  onChangePhoneNumber: (phoneNumber, isValid) =>
    @state.value.phoneNumber = phoneNumber

    @state.isPhoneNumberValid = isValid

  validate: =>
    if not @state.value.name
      return false

    if not @state.value.phoneNumber
      return false

    if not @state.isPhoneNumberValid
      return false

    true

  render: =>
    <Layout title="휴대폰 인증">
      <MagnetView style={{ flex: 1 }}>
        <View style={{ flex: 1, padding: 20 }}>
          <View style={{ alignItems: 'center', marginTop: 20 }}>
            <Image source={require '../../../../images/phone.png'} style={{ width: 50, height: 74 }} />
          </View>
          <Text center size={18} bold marginTop={30}>휴대폰번호를 인증하세요</Text>
          <Input isRequired placeholder="이름" marginTop={30} onChange={@onChangeInput} name="name" value={@state.value.name} />
          <View style={{ height: 10 }} />
          <VerifyPhoneNumber onChange={@onChangePhoneNumber} />
          <Checkbox onChange={@onChangeCheckbox} name="isPhoneNumberMain" isChecked={@state.value.isPhoneNumberMain} label={<Text>이 번호를 내 대표 연락처로 설정합니다.</Text>} marginTop={20} />
        </View>
        <Button isDisabled={not @state.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
      </MagnetView>
    </Layout>
