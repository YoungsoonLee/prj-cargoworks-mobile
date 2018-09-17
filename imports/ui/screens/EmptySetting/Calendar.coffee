export default observer class _Calendar extends Component
  constructor: (props) ->
    super props

    @state = observable
      markedDates:
        [if @props.state.startDate then moment(@props.state.startDate).format('YYYY-MM-DD') else moment().format('YYYY-MM-DD')]:
          selected: true
      date: moment()

      reaction(
        =>
          toJs @state.date
      ,
        =>
          @props.state.startDate = @state.date
      )

      reaction(
        =>
          toJs @props.state.startDate
      ,
        =>
          @state.date = @props.state.startDate
      )

  onPressDay: (day) =>
    markedDates = {}

    markedDates[day.dateString] =
      selected: true

    @state.markedDates = markedDates

    @state.date = moment(day.dateString)

  render: =>
    <View>
      <View style={{ height: 370 }}>
        <Calendar markedDatess={@state.markedDates} onDayPress={@onPressDay} minDate={moment().add(1, 'days').format('YYYY-MM-DD')} keyColor={lightBlue} textSectionTitleColor="#3c4f5e" todayTextColor="#f5d56e" dayTextColor="#3c4f5e" />
      </View>
      <Button borderRadius={0} color="light blue">확인</Button>
    </View>
