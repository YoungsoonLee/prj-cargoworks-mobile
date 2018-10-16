import OrderDetailLayout from '../../layouts/OrderDetailLayout/OrderDetailLayout.coffee'
import OrderInfo from '../../components/OrderInfo/OrderInfo.coffee'
import WayPoints from '../../components/WayPoints/WayPoints.coffee'

export default observer class OrderDetailView extends Component
  # @propTypes:
  #   order: PropTypes.object

  @defaultProps:
    order: {}

  onPressOk: =>
    @props.onPressOk()

  render: =>
    if @props.order.status is @props.ORDERS.STATUS.DISPATCHING.VALUE
      if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.DESIGNATED.VALUE
        dispatchType = 'designated'

      else if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.IN_HOUSE.VALUE
        dispatchType = 'in house'
        dispatchTypeText = '소속 운송사 주문 입니다.'
        dispatchTypeBackgroundColor = '#eafcfe'

      else if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.SHARED.VALUE
        dispatchType = 'in house'
        dispatchTypeText = '수락할 수 있는 주문입니다.'
        dispatchTypeBackgroundColor = white

      else if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.EXCLUSIVE.VALUE
        dispatchType = 'exclusive'
        dispatchTypeText = '전담거래처 주문입니다.'
        dispatchTypeBackgroundColor = '#fffae1'

      else
        dispatchType = 'normal'
        dispatchTypeText = '수락할 수 있는 주문입니다.'
        dispatchTypeBackgroundColor = white

    else
      dispatchType = 'dispatched'
      dispatchTypeText = '이미 배차가 완료된 주문 입니다.'
      dispatchTypeBackgroundColor = '#cccccc'
      dispatchTypeTextColor = white

    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="order">
        <View style={{ height: 40, backgroundColor: dispatchTypeBackgroundColor, alignItems: 'center', justifyContent: 'center' }}>
          <Text bold color={dispatchTypeTextColor}>{ dispatchTypeText }</Text>
        </View>
        <ScrollView>
          <WayPoints type="order" order={@props.order} transporter={@props.transporter} ORDERS={@props.ORDERS} TRANSPORTERS={@props.TRANSPORTERS} />
          <OrderInfo type="order" order={@props.order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} />
          <View style={{ borderTopWidth: 1, borderTopColor: black }} />
        </ScrollView>
      </OrderDetailLayout>
      <Button isDisabled={dispatchType is 'dispatched'} borderRadius={0} height={75} color="light blue" onPress={@onPressOk}>
        <View style={{ flexDirection: 'row' }}>
          <Feather name="check" size={25} color={white} marginTop={-3} />
          <Text bold marginLeft={5} color={white} size={20}>수락하기</Text>
        </View>
      </Button>
    </View>
