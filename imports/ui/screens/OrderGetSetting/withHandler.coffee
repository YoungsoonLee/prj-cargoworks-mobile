export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSave: =>
      weightBoxTypes = @props.state.vehicles.map (vehicle) =>
        vehicleWeight = Util.getVehicleWeight vehicle, @props.TRANSPORTERS

        weight = vehicleWeight[1]

        boxType = vehicleWeight[0]

        WEIGHT = _.find @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
          WEIGHT.VALUE is @props.state.weight

        if WEIGHT
          vehicleType = @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE

        else
          vehicleType = @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE

        vehicleType: vehicleType
        weight: weight
        boxType: boxType

      console.log weightBoxTypes

      console.log @props.state.distance

      # Meteor.call 'transporters.update',
      #   _id: @props.transporter._id
      # ,
      #   $set:


    render: =>
      <WrappedComponent {...@props} onPressSave={@onPressSave} />
