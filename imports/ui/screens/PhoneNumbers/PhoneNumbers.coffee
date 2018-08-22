export default observer class PhoneNumbers extends Component
  render: =>
    <Layout title="휴대폰 번호 관리">
      <ScrollView>
        <View style={{ height: 80, justifyContent: 'center', paddingLeft: 30, backgroundColor: '#eeeeee', borderBottomColor: '#a6a6a6', borderBottomWidth: 1, borderTopColor: '#a6a6a6', borderTopWidth: 1 }}>
          <Text size={18} color={black} bold>이 기기의 휴대폰 번호 : 010-0000-0000</Text>
          <Text size={14} marginTop={5}>번호를 변경하시려면 인증을 다시 받으셔야 합니다.</Text>
        </View>
        <View style={{ height: 80, justifyContent: 'center', paddingLeft: 30, backgroundColor: '#eeeeee', borderBottomColor: '#a6a6a6', borderBottomWidth: 1, borderTopColor: '#a6a6a6', borderTopWidth: 1 }}>
          <Text size={18} color={black} bold>내 휴대폰 전화번호 관리</Text>
          <Text size={14} marginTop={5}>대표 연락처를 선택할 수 있습니다.</Text>
        </View>
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>저장하기</Button>
    </Layout>
