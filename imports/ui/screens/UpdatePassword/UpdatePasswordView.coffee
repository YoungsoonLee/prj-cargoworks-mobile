export default observer class UpdatePasswordView extends Component
  onPressConfirm: =>
    @props.onPressConfirm()

  render: =>
    <Layout title="설정">
      <ScrollView style={{ paddingHorizontal: 30 }} paddingBottom={400}>
        <View style={{ alignItems: 'center', marginTop: 40 }}>
          <Image source={require '../../../../images/update_password.png'} style={{ width: 80, height: 74 }} />
        </View>
        <Text center marginTop={30} size={18} bold>비밀번호를 변경할 수 있습니다.</Text>
        <Text center marginTop={5} size={14}>원하는 비밀번호를 입력하고 저장해 주세요.</Text>
        <Input type="password" marginTop={20} placeholder="기존 비밀번호" state={@props.state} path="password" />
        <View style={{ height: 10 }} />
        <Error error={@props.validation.newPassword.error}>
          <Input type="password" marginTop={5} placeholder="변경할 비밀번호" state={@props.state} path="newPassword" />
        </Error>
        <Error error={@props.validation.newPasswordConfirm.error}>
          <Input type="password" marginTop={5} placeholder="변경할 비밀번호 확인" state={@props.state} path="newPasswordConfirm" />
        </Error>
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressConfirm}>비밀번호 변경하기</Button>
    </Layout>
