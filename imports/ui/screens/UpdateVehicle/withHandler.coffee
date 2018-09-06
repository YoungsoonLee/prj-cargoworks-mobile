export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      WEIGHT = _.find @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
        WEIGHT.VALUE is @props.state.weight

      if WEIGHT
        vehicleType = @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE

      else
        vehicleType = @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE

      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          vehiclePlateNumbers: @props.state.carNumber
          vehicleRegistrationImageUrl: @props.state.carRegisterImageUrl
          vehicleType: vehicleType
          vehicleWeightCapacity: @props.state.weight
          freightBoxType: @props.state.boxType
      , (error) =>
        if error
          Util.alert error.reason

          return

        if @props.state.weight isnt @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE
          Util.go 'UpdateInsurance'

        else
          Util.go 'UpdateInsuranceForOthers'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
