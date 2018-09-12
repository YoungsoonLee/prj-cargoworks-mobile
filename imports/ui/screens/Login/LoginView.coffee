export default observer class LoginView extends Component
  onPressLogin: =>
    @props.onPressLogin()

  onPressSignup: =>
    @props.onPressSignup()

  render: =>
    <Layout title="로그인">
      <ScrollView style={{ padding: 20 }}>
        <View style={{ alignItems: 'center', justifyContent: 'center', flex: 1 }}>
          <Image source={require '../../../../images/splash.png'} style={{ width: 180, height: 180 }} />
        </View>
        <Error error={@props.validation.id.error}>
          <Input state={@props.state} path="id" placeholder="아이디" />
        </Error>
        <Error error={@props.validation.password.error}>
          <Input state={@props.state} path="password" type="password" marginTop={5} placeholder="비밀번호" />
        </Error>
        <Button isDisabled={not @props.validation.isValid} marginTop={30} color="light blue" onPress={@onPressLogin}>로그인</Button>
        <View style={{ alignItems: 'center' }}>
          <Text marginTop={20} size={17}><Text size={17} underline onPress={=>}>아이디 찾기</Text> / <Text size={18} underline onPress={=>}>비밀번호 찾기</Text></Text>
        </View>
        <Button marginTop={48} color="light blue invert" onPress={@onPressSignup}>회원가입</Button>
        <View style={{ height: 300 }} />
      </ScrollView>
    </Layout>
