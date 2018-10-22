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

  render: =>
    if @props.order.status isnt @props.ORDERS.STATUS.COMPLETED.VALUE
      isCompleted = false

      for waypoint in @props.order.waypoints.addresses
        if waypoint.isActive
          activeWaypoint = waypoint

          break

    else
      isCompleted = true

    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="my order">
        <ScrollView>
          <WayPoints type="my order" order={@props.order} transporter={@props.transporter} ORDERS={@props.ORDERS} TRANSPORTERS={@props.TRANSPORTERS} orderInfo={<OrderInfo type="my order" order={@props.order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} />} />
        </ScrollView>
      </OrderDetailLayout>
      { if not isCompleted
        <View>
          { if activeWaypoint?.isTransporterIn
            <Button borderRadius={0} height={75} color="light blue" onPress={@onPressGetSignature}>
              <View style={{ flexDirection: 'row' }}>
                <Image source={require '../../../../images/pencil.png'} style={{ width: 18, height: 18 }} />
                <Text bold marginLeft={5} color={white} size={20}>서명받기</Text>
              </View>
            </Button>
          }
          { if not activeWaypoint?.isTransporterIn
            <Button isDisabled={true} borderRadius={0} height={75} color="light blue">
              <View style={{ flexDirection: 'row' }}>
                <Image source={require '../../../../images/pencil.png'} style={{ width: 18, height: 18 }} />
                <Text bold marginLeft={5} color={white} size={20}>서명받기 (픽업지로 이동하세요)</Text>
              </View>
            </Button>
          }
        </View>
      }
    </View>
