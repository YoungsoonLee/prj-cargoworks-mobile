export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressGetSignature: =>
      index = @props.order.waypoints.addresses.findIndex (address) =>
        address.isActive

      if index is @props.order.waypoints.addresses.length - 1
        isLastAddress = true

      else
        isLastAddress = false

      Util.go 'GetSignature',
        orderId: @props.order._id
        addressIndex: index
        isLastAddress: isLastAddress

    render: =>
      <WrappedComponent {...@props} onPressGetSignature={@onPressGetSignature} />
