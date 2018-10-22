import VerifyPhoneNumber from '../../components/VerifyPhoneNumber/VerifyPhoneNumber.coffee'

export default observer class FindPasswordView extends Component
  onPressSend: =>
    @props.onPressSend()

  render: =>
    <Layout title="비밀번호 찾기">
      <ScrollView paddingBottom={300}>
        <View style={{ flex: 1, padding: 20 }}>
          <View style={{ alignItems: 'center', marginTop: 20 }}>
            <Image source={require '../../../../images/unlock_password.png'} style={{ width: 80, height: 74 }} />
          </View>
          <Text center size={18} bold marginTop={30}>
            휴대폰 번호 인증을 통해{'\n'}
            가입정보를 확인할 수 있습니다.
          </Text>
          <Input placeholder="아이디" marginTop={30} state={@props.state} path="id" />
          <Input placeholder="이름" marginTop={10} state={@props.state} path="name" />
          <View style={{ height: 10 }} />
          <VerifyPhoneNumber state={@props.state} path="phoneNumber" />
        </View>
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressSend}>SMS로 가입정보 전송</Button>
    </Layout>
