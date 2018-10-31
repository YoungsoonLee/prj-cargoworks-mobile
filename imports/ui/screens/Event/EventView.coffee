export default observer class EventView extends Component
  render: =>
    <Layout title="이벤트">
      <ScrollView>
        <Image source={{ uri: @props.event.imageFileUrl }} style={{ width: width, height: width }} />
        <View style={{ padding: 20 }}>
          <Text marginTop={15} size={15} color="#353198">{ moment(@props.event.dateRange.startDate).format('YYYY.MM.DD') } ~ { moment(@props.event.dateRange.endDate).format('YYYY.MM.DD') }</Text>
          <Text marginTop={7} bold size={19}>{ @props.event.title }</Text>
          <Text color="#666666" marginTop={20} size={15}>{ @props.event.content }</Text>
          <View style={{ height: 200 }} />
        </View>
      </ScrollView>
    </Layout>
