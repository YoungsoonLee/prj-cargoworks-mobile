import Order from '../../components/Order/Order.coffee'

export default observer class OrdersView extends Component
  onPressOrder: (order) =>
    Util.go 'OrderDetail',
      id: order._id

  renderOrders: =>
    @props.orders.map (order, index) =>
      <Order key={order._id} onPress={=> @onPressOrder order} order={order} type={if index % 2 is 0 then 'parcel' else 'frieght'} />

  render: =>
    <View style={{ flex: 1, backgroundColor: darkBlue }}>
      <ScrollView style={{ paddingRight: 5, paddingLeft: 5 }}>
        { @renderOrders() }
      </ScrollView>
    </View>
