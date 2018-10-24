export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      recruitments = _.cloneDeep @props.recruitments

      vehicleType = Util.getVehicleType @props.transporter, @props.TRANSPORTERS

      recruitments = recruitments.filter (recruitment) =>
        vehicleType in recruitment.vehicles

      recruitments.forEach (recruitment) =>
        consignor = @props.consignors.find (consignor) =>
          consignor._id is recruitment.consignorId

        recruitment.consignor = consignor

        vehicleTexts = recruitment.vehicles.map (vehicle) =>
          @props.RECRUITMENTS.VEHICLES[vehicle].TEXT

        recruitment.vehicleTexts = vehicleTexts

      <WrappedComponent {...@props} recruitments={recruitments}  />
