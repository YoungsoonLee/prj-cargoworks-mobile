export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      orders = _.cloneDeep @props.orders

      STATUS = @props.ORDERS.STATUS

      if state.header.myOrdersSort is 'in progress'
        orders = orders.filter (order) =>
          order.status in [STATUS.BEFORE_PICKUP.VALUE, STATUS.PICKINGUP.VALUE, STATUS.DELIVERYING.VALUE]

      else if state.header.myOrdersSort is 'today'
        orders = orders.filter (order) =>
          moment(order.createdAt).format('YYYY-MM-DD') is moment().format('YYYY-MM-DD')

      else if state.header.myOrdersSort is 'last'
        orders = orders.filter (order) =>
          order.status not in [STATUS.BEFORE_PICKUP.VALUE, STATUS.PICKINGUP.VALUE, STATUS.DELIVERYING.VALUE] and moment(order.createdAt).format('YYYY-MM-DD') < moment().format('YYYY-MM-DD')

      <WrappedComponent {...@props} orders={orders} />
