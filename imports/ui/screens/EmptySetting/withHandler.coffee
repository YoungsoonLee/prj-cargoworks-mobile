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

    onPressSave: =>
      if @props.state.startDate
        emptyReturnStartsDateAt = moment(@props.state.startDate).toDate()

      else
        emptyReturnStartsDateAt = null

      if @props.state.startTime
        emptyReturnStartsTimeAt = moment(@props.state.startTime).toDate()

      else
        emptyReturnStartsTimeAt = null

      if @props.state.mixType is '1/1'
        availableMixCapacity = @props.TRANSPORTERS.VEHICLES.FREIGHT.MIX_CAPACITY.FULL.VALUE

      else if @props.state.mixType is '1/2'
        availableMixCapacity = @props.TRANSPORTERS.VEHICLES.FREIGHT.MIX_CAPACITY.HALF.VALUE

      else if @props.state.mixType is '1/3'
        availableMixCapacity = @props.TRANSPORTERS.VEHICLES.FREIGHT.MIX_CAPACITY.ONE_THIRD.VALUE

      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $set:
          onEmptyReturn: @props.state.isEmpty
          emptyReturnDesination: @props.state.address
          emptyReturnStartsDateAt: emptyReturnStartsDateAt
          emptyReturnStartsTimeAt: emptyReturnStartsTimeAt
          canMixFreight: @props.state.isMixed
          availableMixCapacity: availableMixCapacity
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.alert '저장되었습니다.'

        Util.back()

    render: =>
      <WrappedComponent {...@props} onPressResetDate={@onPressResetDate} onPressResetTime={@onPressResetTime} onPressOpenTimePickerAndroid={@onPressOpenTimePickerAndroid} onPressSave={@onPressSave} />
