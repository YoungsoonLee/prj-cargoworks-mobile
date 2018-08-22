export default observer class UpdatePassword extends Component
  render: =>
    <Layout title="설정">
      <View style={{ flex: 1, paddingHorizontal: 30 }}>
        <View style={{ alignItems: 'center', marginTop: 40 }}>
          <Image source={require '../../../../images/update_password.png'} style={{ width: 80, height: 74 }} />
        </View>
        <Text center marginTop={30} size={18} bold>비밀번호를 변경할 수 있습니다.</Text>
        <Text center marginTop={5} size={14}>원하는 비밀번호를 입력하고 저장해 주세요.</Text>
        <Input marginTop={20} placeholder="기존 비밀번호" />
        <Input marginTop={5} placeholder="변경할 비밀번호" />
        <Input marginTop={5} placeholder="변경할 비밀번호 확인" />
      </View>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>저장하기</Button>
    </Layout>
