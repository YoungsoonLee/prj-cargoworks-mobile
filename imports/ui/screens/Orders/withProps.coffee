export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      orders = _.cloneDeep @props.orders

      if state.header.ordersSort is 'recent'
        orders = _.sortBy orders, (order) =>
          -order.createdAt.getTime()

      else if state.header.ordersSort is 'distance'
        orders = _.sortBy orders, (order) =>
          distance = Util.getDistance @props.transporter.currentGeoLocation.longitude, @props.transporter.currentGeoLocation.latitude, order.waypoints.addresses[0].tmap.longitude, order.waypoints.addresses[0].tmap.latitude

          distance

      else if state.header.ordersSort is 'fare'
        orders = _.sortBy orders, (order) =>
          -order.agentFare.final

      if state.header.search
        orders = orders.filter (order) =>
          orderString = JSON.stringify order

          regExp = new RegExp state.header.search

          regExp.test orderString

      <WrappedComponent {...@props} orders={orders} />
