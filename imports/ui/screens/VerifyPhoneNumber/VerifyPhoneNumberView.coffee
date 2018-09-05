import VerifyPhoneNumber from '../../components/VerifyPhoneNumber/VerifyPhoneNumber.coffee'

export default observer class VerifyPhoneNumberView extends Component
  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="휴대폰 인증" isKeyboardDismissable>
      <MagnetView style={{ flex: 1 }} offsetOnIos={100}>
        <View style={{ flex: 1, padding: 20 }}>
          <View style={{ alignItems: 'center', marginTop: 20 }}>
            <Image source={require '../../../../images/phone.png'} style={{ width: 50, height: 74 }} />
          </View>
          <Text center size={18} bold marginTop={30}>휴대폰번호를 인증하세요</Text>
          <Input placeholder="이름" marginTop={30} state={@props.state} path="name" />
          <View style={{ height: 10 }} />
          <VerifyPhoneNumber pState={@props.state} path="phoneNumber" />
          <Checkbox state={@props.state} path="isPhoneNumberMain" label="이 번호를 내 대표 연락처로 설정합니다." marginTop={20} />
        </View>
        <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
      </MagnetView>
    </Layout>
