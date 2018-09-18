import { TimePickerAndroid } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressResetDate: =>
      @props.state.startDate = null

    onPressResetTime: =>
      @props.state.startTime = null

    onPressOpenTimePickerAndroid: =>
      result = await TimePickerAndroid.open
        hour: moment().hour()
        minute: moment().minute()
        is24Hour: false

      if result.action isnt TimePickerAndroid.dismissedAction
        time = moment().hour(result.hour).minute(result.minute)

        @props.state.startTime = time

    render: =>
      <WrappedComponent {...@props} onPressResetDate={@onPressResetDate} onPressResetTime={@onPressResetTime} onPressOpenTimePickerAndroid={@onPressOpenTimePickerAndroid} />
