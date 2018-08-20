import { Linking } from 'react-native'

export default observer class OrderInfo extends Component
  # @propTypes:
  #   order: PropTypes.object
  #   isBorderTopVisible: PropTypes.object
  #   isBorderBottomVisible: PropTypes.object

  @defaultProps:
    order: {}
    isBorderTopVisible: true
    isBorderBottomVisible: true

  onPressPhone: (phoneNumber) =>
    phoneNumber = '01042342341'

    Util.confirm "#{phoneNumber}로 전화 하시겠습니까?", =>
      Linking.openURL "tel:#{phoneNumber}"

  onPressAgent: =>
    Util.go 'Agent'

  render: =>
    <View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>주문차량</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>1.4톤 카고</Text>
        </View>
      </View>
      <View style={{ flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', paddingTop: 12, paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>물품정보</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', padding: 10 }}>
          <Text color={black} bold size={16}>
            전자제품이니 주의하여 운행하세요. 취급주의해주시고 도착시 안전한 곳에 보관해주시기 바랍니다. 전자제품이니 주의하여 운행하세요. 취급주의해주시고 도착시 안전한 곳에 보관해주시기 바랍니다. 전자제품이니 주의하여 운행하세요.
          </Text>
        </View>
      </View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>적재방법</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>지게차</Text>
        </View>
      </View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>운송주선</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16} underline onPress={@onPressAgent}>빠르다로지스</Text>
        </View>
      </View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>결제일</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>매월 4일, 25일 결제</Text>
        </View>
      </View>
      <View style={{ position: 'absolute', bottom: 10, right: 10 }}>
        <Touchable onPress={@onPressPhone}>
          <Image source={require '../../../../images/order_phone.png'} style={{ width: 42, height: 42 }} />
        </Touchable>
      </View>
    </View>
