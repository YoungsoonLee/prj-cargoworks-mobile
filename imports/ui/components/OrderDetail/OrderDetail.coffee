import OrderDetailLayout from '../../layouts/OrderDetailLayout/OrderDetailLayout.coffee'
import OrderInfo from '../../components/OrderInfo/OrderInfo.coffee'
import WayPoints from '../../components/WayPoints/WayPoints.coffee'

export default observer class OrderDetail extends Component
  # @propTypes:
  #   order: PropTypes.object

  @defaultProps:
    order: {}

  onPressOk: =>
    Util.confirm '이 주문을 받겠습니까?', =>
      Util.back()

      setTimeout =>
        Util.og 'MyOrders'
      , 500

  render: =>
    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="order">
        <ScrollView>
          {### wayPoints or 필요에 따라서 order 객체를 넘겨야 한다 ###}
          <WayPoints type="order" />
          <OrderInfo order={@props.order} />
          <View style={{ borderTopWidth: 1, borderTopColor: black }} />
        </ScrollView>
      </OrderDetailLayout>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressOk}>
        <View style={{ flexDirection: 'row' }}>
          <Feather name="check" size={25} color={white} marginTop={-3} />
          <Text bold marginLeft={5} color={white} size={20}>수락하기</Text>
        </View>
      </Button>
    </View>
