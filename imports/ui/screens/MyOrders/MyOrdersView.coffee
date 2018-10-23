import Order from '../../components/Order/Order.coffee'

export default observer class MyOrdersView extends Component
  onPressOrder: (order) =>
    Util.go 'MyOrderDetail',
      id: order._id

  renderOrders: (orders) =>
    orders.map (order) =>
      <Order key={order._id} onPress={=> @onPressOrder order} order={order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} transporter={@props.transporter} />

  render: =>
    STATUS = @props.ORDERS.STATUS

    deliveryingOrders = @props.orders.filter (order) =>
      order.status is STATUS.DELIVERYING.VALUE

    beforePickupOrders = @props.orders.filter (order) =>
      order.status in [STATUS.BEFORE_PICKUP.VALUE, STATUS.PICKINGUP.VALUE]

    completedOrders = @props.orders.filter (order) =>
      order.status is STATUS.COMPLETED.VALUE

    lastOrders = @props.orders

    <View style={{ flex: 1, backgroundColor: darkBlue }}>
      <ScrollView style={{ paddingRight: 5, paddingLeft: 5 }}>
        { if state.header.myOrdersSort in ['in progress', 'today']
          <View>
            <Text marginTop={13} size={18} bold color={white}>배송/운행중 ({ deliveryingOrders.length })</Text>
            <View style={{ height: 13 }} />
            { @renderOrders deliveryingOrders }
            <Text marginTop={13} size={18} bold color={white}>픽업/상차/대기 ({ beforePickupOrders.length })</Text>
            <View style={{ height: 13 }} />
            { @renderOrders beforePickupOrders }
          </View>
        }
        { if state.header.myOrdersSort is 'today'
          <View>
            <Text marginTop={13} size={18} bold color={white}>완료 ({ completedOrders.length })</Text>
            <View style={{ height: 13 }} />
            { @renderOrders completedOrders }
          </View>
        }
        { if state.header.myOrdersSort is 'last'
          <View>
            { @renderOrders lastOrders }
          </View>
        }
      </ScrollView>
    </View>
