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

  onPressPhone: =>
    phoneNumber = @props.order.agent.phoneNumber

    Util.confirm "#{phoneNumber}로 전화 하시겠습니까?", =>
      Linking.openURL "tel:#{phoneNumber}"

  onPressAgent: =>
    state.agent.agent = @props.order.agent

    Util.go 'Agent'

  render: =>
    if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE
      vehicleWeightCapacity = @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS[@props.order.vehicleWeightCapacity].TEXT

    else if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
      vehicleWeightCapacity = @props.TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS[@props.order.vehicleWeightCapacity].TEXT

      freightBoxType = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES[@props.order.freightBoxType].TEXT

    if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
      freightLoading = @props.ORDERS.FREIGHT_LOADING[@props.order.waypoints.freightLoading].TEXT

    <View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>주문차량</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>{ vehicleWeightCapacity } { freightBoxType }</Text>
        </View>
      </View>
      <View style={{ flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', paddingTop: 12, paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>물품정보</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', padding: 10 }}>
          <Text color={black} bold size={16}>{ @props.order.agentMemo }</Text>
        </View>
      </View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>적재방법</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>{ freightLoading }</Text>
        </View>
      </View>
      <View style={{ height: 40, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>운송주선</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16} underline onPress={@onPressAgent}>{ @props.order.agent.name }</Text>
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
