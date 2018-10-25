export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressWaypointsMap: =>
      Util.go 'WaypointsMap',
        orderId: @props.order._id

    render: =>
      <WrappedComponent {...@props} onPressWaypointsMap={@onPressWaypointsMap} />
