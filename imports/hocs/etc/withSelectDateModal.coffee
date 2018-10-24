export default withSelectDateModal = (getState, path, handlerName = 'onPressOpenSelectDateModal') =>
  (WrappedComponent) =>
    observer class WithSelectDateModal extends Component
      constructor: (props) ->
        super props

        _markedDate = _get getState(@props), path

        if _markedDate
          markedDate = moment(_markedDate).format('YYYY-MM-DD')

        else
          markedDate = moment().format('YYYY-MM-DD')

        @state = observable
          markedDates:
            [markedDate]:
              selected: true
          date: moment()
          callback: =>

      onPressDay: (day) =>
        markedDates = {}

        markedDates[day.dateString] =
          selected: true

        @state.markedDates = markedDates

        @state.date = moment(day.dateString)

      onPressOpenSelectDateModal: (callback) =>
        @modalRef.open()

        @state.callback = callback

      onPressConfirm: =>
        _set getState(@props), path, @state.date

        @modalRef.close()

        @state.callback()

      onPressClose: =>
        @state.date = moment()

      render: =>
        props =
          [handlerName]: @onPressOpenSelectDateModal

        <View style={{ flex: 1 }}>
          <Modal ref={(ref) => @modalRef = ref} onPressClose={@onPressClose}>
            <View style={{ height: 370 }}>
              <Calendar markedDates={@state.markedDates} onDayPress={@onPressDay} keyColor={lightBlue} textSectionTitleColor="#3c4f5e" todayTextColor="#f5d56e" dayTextColor="#3c4f5e" />
            </View>
            <Button borderRadius={0} color="light blue" onPress={@onPressConfirm}>확인</Button>
          </Modal>
          <WrappedComponent {...@props} {...props} />
        </View>
