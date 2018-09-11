export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      vehicleType = Util.getVehicleType @props.transporter, @props.TRANSPORTERS

      price = @props.insurance[vehicleType]

      <WrappedComponent {...@props} price={7000} />
