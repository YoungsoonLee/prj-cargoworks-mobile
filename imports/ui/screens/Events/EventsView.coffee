import Event from './Event.coffee'

export default observer class EventsView extends Component
  onPressEvent: (event) =>
    @props.onPressEvent event

  renderEvents: =>
    @props.events.map (event) =>
      <Event key={event._id} event={event} onPress={=> @onPressEvent event} />

  render: =>
    <Layout title="이벤트">
      <ScrollView style={{ padding: 20 }}>
        { @renderEvents() }
        <View style={{ height: 200 }} />
      </ScrollView>
    </Layout>
