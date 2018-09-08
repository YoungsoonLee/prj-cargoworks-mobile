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

  onPressUploadFreightCert: =>
    Util.go 'UploadFreightCert'

  onPressPublishCashReceipt: =>
    Util.go 'PublishCashReceipt'

  render: =>
    <View style={{ flex: 1 }}>
      <OrderDetailLayout order={@props.order} type="my order">
        <ScrollView>
          <WayPoints type="my order" order={@props.order} transporter={@props.transporter} ORDERS={@props.ORDERS} TRANSPORTERS={@props.TRANSPORTERS} orderInfo={<OrderInfo type="my order" order={@props.order} TRANSPORTERS={@props.TRANSPORTERS} ORDERS={@props.ORDERS} />} />
        </ScrollView>
      </OrderDetailLayout>
      { 1 is 1 and
        <Button borderRadius={0} height={75} color="light blue" onPress={@onPressGetSignature}>
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
      <View style={{ flexDirection: 'row' }}>
        { 1 is 2 and
          <View style={{ flex: 1 }}>
            <Button borderRadius={0} height={75} color="grey" onPress={@onPressUploadFreightCert}>화물 인수증 업로드</Button>
          </View>
          }
        { 1 is 2 and
          <View style={{ flex: 1 }}>
            <Button paddingHorizontal={0} borderRadius={0} height={75} color="light blue" onPress={@onPressPublishCashReceipt}>고객 현금영수증 발행</Button>
          </View>
          }
      </View>
    </View>
