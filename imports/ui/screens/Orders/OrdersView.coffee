import Order from '../../components/Order/Order.coffee'

export default observer class OrdersView extends Component
  onPressOrder: (order) =>
    Util.go 'OrderDetail',
      id: order._id

  renderOrders: =>
    @props.orders.map (order) =>
      <Order key={order._id} onPress={=> @onPressOrder order} order={order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} />

  render: =>
    <View style={{ flex: 1, backgroundColor: darkBlue }}>
      { if @props.orders.length > 0
        <ScrollView style={{ paddingRight: 5, paddingLeft: 5 }}>
          { @renderOrders() }
        </ScrollView>
      else
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Image source={require '../../../../images/nothing.png'} style={{ width: 70, height: 70 }} />
          <Text center size={17} color={white} marginTop={25}>수신된 주문이 없습니다</Text>
          <Text marginTop={5} size={17} color={white}><Text bold size={17} color="#fff79a">주문설정 - 주문수신설정</Text>을 확인하세요</Text>
        </View>
      }
    </View>
