import OrderDetailLayout from '../../layouts/OrderDetailLayout/OrderDetailLayout.coffee'
import OrderInfo from '../../components/OrderInfo/OrderInfo.coffee'
import WayPoints from '../../components/WayPoints/WayPoints.coffee'

export default observer class OrderDetailView extends Component
  # @propTypes:
  #   order: PropTypes.object

  @defaultProps:
    order: {}

  constructor: (props) ->
    super props

    console.log 'OrderDetailView props: ', props

    Meteor.call 'orders.update',
      _id: props.order._id
    ,
      $addToSet:
        detailViewTransporters: props.user.profile.transporterId
        listViewTransporters: props.user.profile.transporterId
    , (error, result) =>
      if error
        Util.alert error.reason
        return

  onPressOk: =>
    @props.onPressOk()

  onPressDecline: =>
    @props.onPressDecline()

  render: =>
    second = parseInt(@props.state.remainedSecond % 60)

    if second < 10
      secondText = '0' + second

    else
      secondText = second.toString()

    minute = parseInt(@props.state.remainedSecond / 60)

    if minute < 10
      minuteText = '0' + minute

    else
      minuteText = minute.toString()

    _width = width * @props.state.remainedSecond / @props.state.maxSecond

    if @props.order.status is @props.ORDERS.STATUS.DISPATCHING.VALUE
      if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.DESIGNATED.VALUE
        dispatchType = 'designated'
        dispatchTypeText = "지정배차 주문 입니다. (#{minuteText}:#{secondText})"
        dispatchTypeBackgroundColor = white

      else if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.IN_HOUSE.VALUE
        dispatchType = 'in house'
        dispatchTypeText = '소속 운송주선사 주문 입니다.'
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
          <View style={{ zIndex: 1 }}>
            <Text bold color={dispatchTypeTextColor}>{ dispatchTypeText }</Text>
          </View>
          { if dispatchType is 'designated'
            <View style={{ position: 'absolute', top: 0, left: 0, height: 40, width: _width, backgroundColor: '#ef525f' }} />
          }
        </View>
        <ScrollView>
          <WayPoints type="order" order={@props.order} transporter={@props.transporter} ORDERS={@props.ORDERS} TRANSPORTERS={@props.TRANSPORTERS} />
          <OrderInfo transporter={@props.transporter} type="order" order={@props.order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} />
          <View style={{ borderTopWidth: 1, borderTopColor: black }} />
        </ScrollView>
      </OrderDetailLayout>
      <View style={{ flexDirection: 'row' }}>
        { if dispatchType is 'designated'
          <View style={{ flex: 1 }}>
            <Button borderRadius={0} height={75} color="dark grey" onPress={@onPressDecline}>거절하기</Button>
          </View>
        }
        <View style={{ flex: 1 }}>
          <Button isDisabled={dispatchType is 'dispatched'} borderRadius={0} height={75} color="light blue" onPress={@onPressOk}>
            <View style={{ flexDirection: 'row' }}>
              <Feather name="check" size={25} color={white} marginTop={-3} />
              <Text bold marginLeft={5} color={white} size={20}>수락하기</Text>
            </View>
          </Button>
        </View>
      </View>
    </View>
