export default observer class Agent extends Component
  renderInfos: =>
    infos = [
      label: '운송 주선'
      content: state.agent.agent.name
    ,
      label: '사업자'
      content: state.agent.agent.regNumber
    ,
      label: '대표자명'
      content: state.agent.agent.ownerName
    ,
      label: '사업장'
      content: state.agent.agent.address
    ,
      label: '대표번호'
      content: state.agent.agent.phoneNumber
    ,
      label: '이메일'
      content: state.agent.agent.taxationEmail
    ]

    infos.map (info, index) =>
      <View key={index} style={{ flexDirection: 'row', height: 35 }}>
        <View style={{ width: 100, borderRightWidth: 1, borderRightColor: '#a2aabf', paddingLeft: 10, justifyContent: 'center' }}>
          <Text color={black} size={17} bold>{ info.label }</Text>
        </View>
        <View style={{ flex: 1, paddingLeft: 10, justifyContent: 'center' }}>
          <Text color={black} size={17} bold>{ info.content }</Text>
        </View>
      </View>

  render: =>
    <Layout title="운송주선사 정보">
      <View style={{ flex: 1, backgroundColor: darkBlue }}>
        <View style={{ backgroundColor: white }}>
          { @renderInfos() }
        </View>
      </View>
    </Layout>
