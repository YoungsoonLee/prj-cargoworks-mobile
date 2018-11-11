import OrderDetailLayout from '../../layouts/OrderDetailLayout/OrderDetailLayout.coffee'
import OrderInfo from '../../components/OrderInfo/OrderInfo.coffee'
import WayPoints from '../../components/WayPoints/WayPoints.coffee'

export default observer class MyOrderDetailView extends Component
  # @propTypes:
  #   order: PropTypes.object

  @defaultProps:
    order: {}

  onPressGetSignature: =>
    @props.onPressGetSignature()

  onPressPhone: (phoneNumber) =>
    @props.onPressPhone phoneNumber

  render: =>
    if @props.order.status isnt @props.ORDERS.STATUS.COMPLETED.VALUE
      isCompleted = false

    else
      isCompleted = true

    activeWaypoint = null

    isStart = false
    isLast = false

    @props.order.waypoints.addresses.forEach (waypoint, index) =>
      if waypoint.isActive
        activeWaypoint = waypoint

        isStart = index is 0
        isLast = index is (@props.order.waypoints.addresses.length - 1)

    isExclusive = @props.order.consignor._id in @props.transporter.connectedExclusiveConsignorIds

    signatureButtonDisabled = activeWaypoint and isLast and not activeWaypoint.isTransporterIn

    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="my order">
        <ScrollView>
          <View style={{ backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: lightBlue, flexDirection: 'row', padding: 10 }}>
            <View style={{ width: 75, borderRightWidth: 1, borderRightColor: '#a2aabf' }}>
              <Text white bold size={18}>주문처</Text>
            </View>
            <View style={{ flex: 1, paddingLeft: 10 }}>
              <Text white bold size={19}>
                { @props.order.consignor.name }{ isExclusive and ' (전담거래처)' }{'\n'}
                { @props.order.consignorPersonnel.name }
              </Text>
              <Text bold marginTop={2} size={14} color="#a2aabf">주문 수락 { moment(@props.order.dispatchedAt).format('YY.MM.DD HH:mm') }</Text>
            </View>
            <View style={{ width: 60, justifyContent: 'flex-end', alignItems: 'center' }}>
              <Touchable onPress={=> @onPressPhone @props.order.consignor.phoneNumber}>
                <Image source={require '../../../../images/order_phone_white.png'} style={{ width: 42, height: 42, marginRight: -15 }} />
              </Touchable>
            </View>
          </View>
          <WayPoints type="my order" order={@props.order} transporter={@props.transporter} ORDERS={@props.ORDERS} TRANSPORTERS={@props.TRANSPORTERS} orderInfo={<OrderInfo type="my order" order={@props.order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} transporter={@props.transporter} />} />
        </ScrollView>
      </OrderDetailLayout>
      { if not isCompleted
        ### <Button isDisabled={not activeWaypoint?.isTransporterIn} borderRadius={0} height={75} color="light blue" onPress={@onPressGetSignature}> ###
        <Button borderRadius={0} height={75} color="light blue" onPress={@onPressGetSignature}>
          <View style={{ flexDirection: 'row' }}>
            <Image source={require '../../../../images/pencil.png'} style={{ width: 18, height: 18 }} />
            <Text bold marginLeft={5} color={white} size={20}>서명받기{ not activeWaypoint?.isTransporterIn and isStart and ' (픽업지로 이동하세요)' } </Text>
          </View>
        </Button>
      }
    </View>
