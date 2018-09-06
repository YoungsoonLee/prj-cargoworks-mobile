export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      orders = _.cloneDeep @props.orders

      if state.header.sort is 'recent'
        orders = _.sortBy orders, (order) =>
          -order.createdAt.getTime()

      else if state.header.sort is 'distance'
        orders = _.sortBy orders, (order) =>
          order.waypoints.distance

      else if state.header.sort is 'fare'
        orders = _.sortBy orders, (order) =>
          -order.agentFare.final
          
      <WrappedComponent {...@props} orders={orders} />
