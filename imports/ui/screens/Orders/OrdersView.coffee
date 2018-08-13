import Order from './Order.coffee'

export default observer class OrdersView extends Component
  renderOrders: =>
    @props.orders.map (order, index) =>
      <Order order={order} type={if index % 2 is 0 then 'parcel' else 'frieght'} />

  render: =>
    <View style={{ flex: 1, backgroundColor: darkBlue }}>
      <ScrollView style={{ paddingRight: 5, paddingLeft: 5 }}>
        { @renderOrders() }
      </ScrollView>
    </View>
