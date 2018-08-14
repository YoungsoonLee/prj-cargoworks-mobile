import OrderDetailLayout from '../../layouts/OrderDetailLayout/OrderDetailLayout.coffee'
import OrderInfo from '../../components/OrderInfo/OrderInfo.coffee'
import WayPoints from '../../components/WayPoints/WayPoints.coffee'

export default observer class MyOrderDetail extends Component
  # @propTypes:
  #   order: PropTypes.object

  @defaultProps:
    order: {}

  render: =>
    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="my order">
        <ScrollView>
          {### wayPoints or 필요에 따라서 order 객체를 넘겨야 한다 ###}
          <WayPoints type="my order" orderInfo={<OrderInfo order={@props.order} />} />
          <View style={{ borderTopWidth: 1, borderTopColor: black }} />
        </ScrollView>
      </OrderDetailLayout>
      { 1 is 2 and
        <Button borderRadius={0} height={75} color="light blue">
          <View style={{ flexDirection: 'row' }}>
            <Image source={require '../../../../images/pencil.png'} style={{ width: 18, height: 18 }} />
            <Text bold marginLeft={5} color={white} size={20}>서명받기</Text>
          </View>
        </Button>
        }
      { 1 is 2 and
        <Button isDisabled={true} borderRadius={0} height={75} color="light blue">
          <View style={{ flexDirection: 'row' }}>
            <Image source={require '../../../../images/pencil.png'} style={{ width: 18, height: 18 }} />
            <Text bold marginLeft={5} color={white} size={20}>서명받기 (픽업지로 이동하세요)</Text>
          </View>
        </Button>
        }
      { 1 is 1 and
        <Button borderRadius={0} height={75} color="light blue">고객 현금영수증 발행</Button>
        }
    </View>
