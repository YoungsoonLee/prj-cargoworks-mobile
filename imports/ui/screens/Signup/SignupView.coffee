export default observer class SignupView extends Component
  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="계정 만들기" isKeyboardDismissable>
      <MagnetView style={{ flex: 1 }} offsetOnIos={100}>
        <View style={{ flex: 1, padding: 20 }}>
          <View style={{ alignItems: 'center', marginTop: 20 }}>
            <Image source={require '../../../../images/phone.png'} style={{ width: 50, height: 74 }} />
          </View>
          <Text center size={18} bold marginTop={30}>
            { state.verifyPhoneNumberValue.name }{'\n'}
            { state.verifyPhoneNumberValue.phoneNumber }
          </Text>
          <Error error={@props.validation.id.error}>
            <Input placeholder="아이디" marginTop={30} state={@props.state} path="id" />
          </Error>
          <Error error={@props.validation.password.error}>
            <Input type="password" placeholder="비밀번호" marginTop={10} state={@props.state} path="password" />
          </Error>
          <Error error={@props.validation.passwordConfirm.error}>
            <Input type="password" placeholder="비밀번호 확인" marginTop={10} state={@props.state} path="passwordConfirm" />
          </Error>
        </View>
        <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
      </MagnetView>
    </Layout>
