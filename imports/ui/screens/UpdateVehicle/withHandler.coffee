export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      WEIGHT = _.find @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
        WEIGHT.VALUE is @props.state.value.weight

      if WEIGHT
        vehicleType = @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE

      else
        vehicleType = @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE

      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          vehiclePlateNumbers: @props.state.value.carNumber
          vehicleRegistrationImageUrl: @props.state.value.carRegisterImageUrl
          vehicleType: vehicleType
          vehicleWeightCapacity: @props.state.value.weight
          freightBoxType: @props.state.value.boxType
      , (error) =>
        if error
          Util.alert error.reason

          return

        if @props.state.value.weight is @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE
          Util.go 'UpdateInsurance'

        else
          Util.go 'UpdateInsuranceForOthers'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
