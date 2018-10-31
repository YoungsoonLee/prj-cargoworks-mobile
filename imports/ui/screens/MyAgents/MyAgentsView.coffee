import CwHeader from '../../components/CwHeader/CwHeader.coffee'
import MyAgent from '../../components/MyAgent/MyAgent.coffee'

export default observer class MyAgentsView extends Component
  onChangeCheckbox: (myAgent) =>
    @props.onChangeCheckbox myAgent

  renderAgents: =>
    @props.myAgents.map (myAgent) =>
      <MyAgent myAgent={myAgent} isChecked={@props.state.checkedMyAgent.id is myAgent.id} onChangeCheckbox={=> @onChangeCheckbox myAgent} />

  onPressSave: =>
    @props.onPressSave()

  render: =>
    <Layout title="소속 운송주선사 설정">
      <ScrollView>
        <View style={{ height: 140, justifyContent: 'center', alignItems: 'center' }}>
          <Text size={18} bold>{ if @props.agent._id then "현재 소속 운송주선사는 #{@props.agent.name} 입니다." else '현재 개인 기사로 활동중입니다.'}</Text>
          <Text center color="#666666" size={14} marginTop={10}>하나의 운송주선사에만 소속될 수 있습니다.</Text>
          <Text center color="#666666" size={14} marginTop={1}>소속 운송주선사가 없어도 개인으로 활동 할 수 있습니다.</Text>
        </View>
        <CwHeader>소속 운송주선사 변경</CwHeader>
        { @renderAgents() }
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>저장하기</Button>
    </Layout>
