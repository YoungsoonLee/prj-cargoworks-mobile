export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressAddressOrder: (addressOrder) =>
      Util.go 'OrdersByAddress2',
        depth: @props.routeParam.depth + 1
        previousAddress: addressOrder.address

    render: =>
      <WrappedComponent {...@props} onPressAddressOrder={@onPressAddressOrder} />
