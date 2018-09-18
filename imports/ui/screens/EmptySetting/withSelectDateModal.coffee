export default withSelectDateModal = (WrappedComponent) =>
  observer class WithSelectDateModal extends Component
    constructor: (props) ->
      super props

      @state = observable
        markedDates:
          [if @props.state.startDate then moment(@props.state.startDate).format('YYYY-MM-DD') else moment().format('YYYY-MM-DD')]:
            selected: true
        date: moment()

    onPressDay: (day) =>
      markedDates = {}

      markedDates[day.dateString] =
        selected: true

      @state.markedDates = markedDates

      @state.date = moment(day.dateString)

    onPressOpenSelectDateModal: =>
      @modalRef.open()

    onPressConfirm: =>
      @props.state.startDate = @state.date

      @modalRef.close()

    onPressClose: =>
      @state.date = moment()

    render: =>
      <View style={{ flex: 1 }}>
        <Modal ref={(ref) => @modalRef = ref} onPressClose={@onPressClose}>
          <View style={{ height: 370 }}>
            <Calendar markedDates={@state.markedDates} onDayPress={@onPressDay} minDate={moment().format('YYYY-MM-DD')} keyColor={lightBlue} textSectionTitleColor="#3c4f5e" todayTextColor="#f5d56e" dayTextColor="#3c4f5e" />
          </View>
          <Button borderRadius={0} color="light blue" onPress={@onPressConfirm}>확인</Button>
        </Modal>
        <WrappedComponent {...@props} onPressOpenSelectDateModal={@onPressOpenSelectDateModal} />
      </View>
