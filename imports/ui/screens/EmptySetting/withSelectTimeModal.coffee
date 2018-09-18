import { DatePickerIOS } from 'react-native'

export default withSelectDateModal = (WrappedComponent) =>
  observer class WithSelectDateModal extends Component
    constructor: (props) ->
      super props

      @state = observable
        time: moment()

    onPressOpenSelectTimeModal: =>
      @modalRef.open()

    onPressConfirm: =>
      @props.state.startTime = @state.time

      @modalRef.close()

    onPressClose: =>
      @state.time = moment()

    onChangeTime: (date) =>
      @state.time = moment(date)

    render: =>
      <View style={{ flex: 1 }}>
        <Modal ref={(ref) => @modalRef = ref} onPressClose={@onPressClose}>
          <View style={{ height: 250 }}>
            <DatePickerIOS date={@state.time.toDate()} mode="time" onDateChange={@onChangeTime} />
          </View>
          <Button borderRadius={0} color="light blue" onPress={@onPressConfirm}>확인</Button>
        </Modal>
        <WrappedComponent {...@props} onPressOpenSelectTimeModal={@onPressOpenSelectTimeModal} />
      </View>
