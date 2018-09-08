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
    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="order">
        <ScrollView>
          <WayPoints type="order" order={@props.order} transporter={@props.transporter} ORDERS={@props.ORDERS} TRANSPORTERS={@props.TRANSPORTERS} />
          <OrderInfo type="order" order={@props.order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} />
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
