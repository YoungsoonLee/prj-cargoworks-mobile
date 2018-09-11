export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      # WEIGHT만으로는 PARCEL인지 FREIGHT인지 알수 없기 때문에 @props.state.weight가 PARCEL.WEIGHTS에 있으면 PARCEL이고 이 값을 vehicleType에 update한다
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

        # 오토바이이면 UpdateInsurance 나머지는 UpdateInsuranceForOthers로 간다
        if @props.state.weight is @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE
          Util.go 'UpdateInsurance'

        else
          Util.go 'UpdateInsuranceForOthers'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
