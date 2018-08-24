export default observer class Login extends Component
  constructor: (props) ->
    super props

    @state = observable
      id: ''
      password: ''

  onPressLogin: =>
    Util.login @state.id, @state.password, (error) =>
      if error
        Util.alert error.reason

        return

      Util.reset 'Main'

  onPressSignup: =>
    Util.go 'VerifyPhoneNumber'

  onChangeInput: (value, isValid, name) =>
    @state[name] = value

  render: =>
    <Layout title="로그인">
      <View style={{ flex: 1, padding: 20 }}>
        <View style={{ alignItems: 'center', marginTop: -30 }}>
          <Image source={require '../../../../images/splash.png'} style={{ width: 180, height: 180 }} />
        </View>
        <Text center size={18} marginTop={-20}>
          안녕하세요! 카고웍스입니다{'\n'}
          로그인 또는 회원가입 후 사용 가능합니다
        </Text>
        <View style={{ flex: 1 }} />
        <Input placeholder="아이디" onChange={@onChangeInput} value={@state.id} name="id" />
        <Input type="password" marginTop={5} placeholder="비밀번호" onChange={@onChangeInput} value={@state.password} name="password" />
        <Button marginTop={30} color="light blue" onPress={@onPressLogin}>로그인</Button>
        <View style={{ alignItems: 'center' }}>
          <Text marginTop={20} size={17}><Text size={17} underline onPress={=>}>아이디 찾기</Text> / <Text size={18} underline onPress={=>}>비밀번호 찾기</Text></Text>
        </View>
        <Button marginTop={48} color="light blue invert" onPress={@onPressSignup}>회원가입</Button>
      </View>
    </Layout>
