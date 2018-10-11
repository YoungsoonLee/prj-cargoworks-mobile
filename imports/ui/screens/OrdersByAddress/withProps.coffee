export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      orders = _.cloneDeep @props.orders

      if @props.routeParam.previousAddress
        orders = orders.filter (order) =>
          startDaum = order.waypoints.addresses[0].daum

          previousAddress = Util.getPartialAddress @props.routeParam.depth - 1, startDaum.jibunAddress or startDaum.autoJibunAddress, startDaum.sido, startDaum.sigungu

          previousAddress is @props.routeParam.previousAddress

      groupedOrders = _.groupBy orders, (order) =>
        startDaum = order.waypoints.addresses[0].daum

        addr = Util.getPartialAddress @props.routeParam.depth, startDaum.jibunAddress or startDaum.autoJibunAddress, startDaum.sido, startDaum.sigungu

        addr

      addressOrders = _.map groupedOrders, (groupedOrder, key) =>
        address: key
        count: groupedOrder.length

      addressOrders = _.sortBy addressOrders, (addressOrder) =>
        -addressOrder.count

      <WrappedComponent {...@props} addressOrders={addressOrders} />
