export default observer class InvitationView extends Component
  onPressAccept: =>
    @props.onPressAccept()

  onPressDecline: =>
    @props.onPressDecline()

  render: =>
    <Layout title="초대받은 계정" isBackButtonVisible={false}>
      <View style={{ flex: 1 }}>
        <Text size={18} bold color="#666666" center marginTop={30}>
          <Text center size={18} bold>{ @props.transporter.name }</Text> 님은 현재{'\n'}
          <Text center size={18} color="#c12d3a" bold>{ @props.agent.name }</Text>{'\n'}
          으로 초대되었습니다.
        </Text>
        <Text size={18} bold color="#666666" center marginTop={30}>
          해당 운송사 소속기사로{'\n'}
          활동하시겠습니까?
        </Text>
      </View>
      <View style={{ padding: 30 }}>
        <Button color="light blue" onPress={@onPressAccept}>소속기사로 활동하기</Button>
        <Button color="white and red" marginTop={10} onPress={@onPressDecline}>거절하기</Button>
      </View>
    </Layout>
