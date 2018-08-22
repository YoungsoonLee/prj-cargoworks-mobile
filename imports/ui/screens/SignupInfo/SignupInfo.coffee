export default observer class SignupInfo extends Component
  onPressNex: =>
    Util.go 'Login'

  render: =>
    <Layout title="카고웍스 운전자 가입 안내" isBackButtonVisible={false}>
      <ScrollView style={{ flex: 1, padding: 20 }}>
        <Text bold size={20} color={black}>
          카고웍스에서 운전자로 가입하실 때{'\n'}
          다음과 같은 방법으로 정보를 수집합니다.
        </Text>
        <View style={{ borderBottomWidth: 1, borderBottomColor: '#999999', marginTop: 20 }} />
        <Text color="#4d6ab5" marginTop={20} bold size={17}>01</Text>
        <Text color="#4d6ab5" bold size={17} marginTop={5}>차량등록증 사진본 업로드</Text>
        <Text marginTop={5} size={15}>
          입력한 차량번호와 일치하는지 그리고 화물차량의 경우{'\n'}
          영업용이 맞는지 확인하기 위한 용도로만 사용됩니다.
        </Text>
        <Text color="#4d6ab5" marginTop={20} bold size={17}>02</Text>
        <Text color="#4d6ab5" bold size={17} marginTop={5}>사업자등록 정보 입력</Text>
        <Text marginTop={5} size={15}>
          영업용 화물차량의 경우에만 수집합니다.{'\n'}
          입력시 운임에 대한 현금영수증 자동발행(일반과세자){'\n'}
          기능을 편리하게 이용할 수 있습니다.
        </Text>
        <Text color="#4d6ab5" marginTop={20} bold size={17}>03</Text>
        <Text color="#4d6ab5" bold size={17} marginTop={5}>주민등록번호 수집하지 않음</Text>
        <Text marginTop={5} size={15}>
          기본적으로 수집하지 않습니다.{'\n'}
          다만 적재물 배상보험 또는 운전자 상해보험의 가입을{'\n'}
          선택한 경우에만 피보험자 정보를 보험사에 제출하기{'\n'}
          위해 수집합니다.
        </Text>
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressNex}>다음</Button>
    </Layout>
