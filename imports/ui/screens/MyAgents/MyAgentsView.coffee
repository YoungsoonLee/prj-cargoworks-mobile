import CwHeader from '../../components/CwHeader/CwHeader.coffee'

export default observer class MyAgentsView extends Component
  renderAgents: =>
    agents = [0..5]

    agents.map (agent) =>
      <View key={agent} style={{ height: 65, flexDirection: 'row', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ width: 65, justifyContent: 'center', alignItems: 'center' }}>
          <CheckboxControlled />
        </View>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text bold size={18} color="#333333">(주)무빗퀵</Text>
        </View>
        <View style={{ width: 75, justifyContent: 'center', alignItems: 'center' }}>
          <Button color="white and red" width={50} height={35} textSize={13} paddingHorizontal={0}>거절</Button>
        </View>
      </View>

  onPressSave: =>
    @props.onPressSave()

  render: =>
    <Layout title="소속 운송사 설정">
      <ScrollView>
        <View style={{ height: 140, justifyContent: 'center', alignItems: 'center' }}>
          <Text size={18} bold>현재 소속 운송사는 (주)무빗퀵 입니다.</Text>
          <Text center color="#666666" size={14} marginTop={10}>하나의 운송사에만 소속될 수 있습니다.</Text>
          <Text center color="#666666" size={14} marginTop={1}>소속 운송사가 없어도 개인으로 활동 할 수 있습니다.</Text>
        </View>
        <CwHeader>소속 운송사 변경</CwHeader>
        { @renderAgents() }
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>저장하기</Button>
    </Layout>
