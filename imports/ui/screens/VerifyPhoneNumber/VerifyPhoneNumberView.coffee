import VerifyPhoneNumber from '../../components/VerifyPhoneNumber/VerifyPhoneNumber.coffee'

export default observer class VerifyPhoneNumberView extends Component
  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="휴대폰 인증">
      <ScrollView paddingBottom={300}>
        <View style={{ flex: 1, padding: 20 }}>
          <View style={{ alignItems: 'center', marginTop: 20 }}>
            <Image source={require '../../../../images/phone.png'} style={{ width: 50, height: 74 }} />
          </View>
          <Text center size={18} bold marginTop={30}>휴대폰번호를 인증하세요</Text>
          <Input placeholder="이름" marginTop={30} state={@props.state} path="name" />
          <View style={{ height: 10 }} />
          <VerifyPhoneNumber state={@props.state} path="phoneNumber" />
        </View>
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
