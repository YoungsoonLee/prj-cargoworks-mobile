import Order from '../../components/Order/Order.coffee'

export default observer class MyOrdersView extends Component
  onPressOrder: (order) =>
    Util.go 'MyOrderDetail',
      id: order._id

  renderOrders: =>
    @props.orders.map (order, index) =>
      if index > 2
        return null

      <Order key={order._id} onPress={=> @onPressOrder order} order={order} type={if index % 2 is 0 then 'parcel' else 'frieght'} />

  render: =>
    <View style={{ flex: 1, backgroundColor: darkBlue }}>
      <ScrollView style={{ paddingRight: 5, paddingLeft: 5 }}>
        <Text marginTop={13} size={18} bold color={white}>배송/하차중 ({ 1 })</Text>
        <View style={{ height: 13 }} />
        { @renderOrders() }
        <Text marginTop={13} size={18} bold color={white}>픽업/상차 대기 ({ 2 })</Text>
        <View style={{ height: 13 }} />
        { @renderOrders() }
      </ScrollView>
    </View>
