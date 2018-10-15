export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressOrderDetail: =>
      Util.go 'OrderDetail',
        id: @props.balance.orderId

    render: =>
      <WrappedComponent {...@props} onPressOrderDetail={@onPressOrderDetail} />
