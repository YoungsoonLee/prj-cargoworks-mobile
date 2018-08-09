export default observer class SignupView extends Component
  constructor: (props) ->
    super props

    @state = observable
      value: @props.state.value
      error: ''

    reaction(
      =>
        JSON.stringify @state.value
    ,
      =>
        @props.state.value = @state.value
    )

    reaction(
      =>
        JSON.stringify @props.state.value
    ,
      =>
        @state.value = @props.state.value
    )

    reaction(
      =>
        @getError()
    ,
      =>
        @state.error = @getError()
    )

  onChangeInput: (value, isValid, name) =>
    @state.value[name] = value

    @props.validation[name] = isValid

  getError: =>
    if @state.value.password isnt @state.value.passwordConfirm
      return '비밀번호가 같지 않습니다'

    ''

  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="계정 만들기">
      <View style={{ flex: 1, padding: 20 }}>
        <View style={{ alignItems: 'center' }}>
          <Image source={require '../../../../images/phone.png'} style={{ width: 50, height: 74 }} />
        </View>
        <Text center size={18} bold marginTop={30}>
          { state.verifyPhoneNumberValue.name }{'\n'}
          { state.verifyPhoneNumberValue.phoneNumber }
        </Text>
        <Input isRequired placeholder="아이디" marginTop={10} onChange={@onChangeInput} name="username" value={@state.value.username} />
        <Input isRequired type="password" placeholder="비밀번호" marginTop={10} onChange={@onChangeInput} name="password" value={@state.value.password} />
        <Input isRequired type="password" placeholder="비밀번호 확인" marginTop={10} onChange={@onChangeInput} name="passwordConfirm" value={@state.value.passwordConfirm} />
      </View>
      <Button error={@state.error} isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
