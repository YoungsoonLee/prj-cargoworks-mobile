export default observer class RecruitmentView extends Component
  onPressApply: =>
    @props.onPressApply()

  renderItems: =>
    @props.items.map (item, index) =>
      <View key={index} style={{ flexDirection: 'row' }}>
        <View style={{ width: 110, paddingVertical: 5, paddingLeft: 10, borderRightWidth: 1, borderRightColor: '#a2aabf' }}>
          <Text color={darkBlue} bold>{ item.title }</Text>
        </View>
        <View style={{ flex: 1, paddingVertical: 5, paddingHorizontal: 10 }}>
          <Text bold color="#111111" size={14}>{ item.content }</Text>
        </View>
      </View>

  render: =>
    <Layout title="전담기사 모집공고 상세">
      <ScrollView>
        <View style={{ width: 110, height: 10, borderRightWidth: 1, borderRightColor: '#a2aabf' }} />
        { @renderItems() }
        <View style={{ width: 110, height: 100, borderRightWidth: 1, borderRightColor: '#a2aabf' }} />
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressApply}>지원하기</Button>
    </Layout>
