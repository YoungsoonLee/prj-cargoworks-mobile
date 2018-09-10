import { Linking } from 'react-native'

export default observer class OrderInfoView extends Component
  # @propTypes:
  #   order: PropTypes.object
  #   ORDERS: PropTypes.object
  #   TRANSPORTERS: PropTypes.object
  #   type: PropTypes.oneOf ['order', 'my order']

  @defaultProps:
    order: {}
    ORDERS: {}
    TRANSPORTERS: {}
    type: 'order'

  onPressPhone: (phoneNumber) =>
    @props.onPressPhone phoneNumber

  onPressAgent: =>
    state.agent.agent = @props.order.agent

    @props.onPressAgent()

  onPressUploadFreightCert: =>
    @props.onPressUploadFreightCert()

  onPressPublishCashReceipt: =>
    @props.onPressPublishCashReceipt()

  render: =>
    if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE
      vehicleWeightCapacity = @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS[@props.order.vehicleWeightCapacity].TEXT

    else if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
      vehicleWeightCapacity = @props.TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS[@props.order.vehicleWeightCapacity].TEXT

      freightBoxType = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES[@props.order.freightBoxType].TEXT

    if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
      freightLoading = @props.ORDERS.FREIGHT_LOADING[@props.order.waypoints.freightLoading].TEXT

    waypoints = @props.order.waypoints.addresses

    if @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.IMMEDIATE.VALUE
      if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE
        pickUpSchedule = ''

      else if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
        pickUpSchedule = '즉시'

    else if @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.RESERVED.VALUE
      pickUpSchedule = Util.getShortPickUpScheduledAt @props.order.waypoints.pickUpScheduledAt

    if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE
      dischargeSchedule = ''

    else if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
      if @props.order.waypoints.dischargeSchedule is @props.ORDERS.DISCHARGE_SCHEDULE.SAME_DAY.VALUE
        dischargeSchedule = '당일'

      else if @props.order.waypoints.dischargeSchedule is @props.ORDERS.DISCHARGE_SCHEDULE.NEXT_DAY.VALUE
        dischargeSchedule = '익일'

      else if @props.order.waypoints.dischargeSchedule is @props.ORDERS.DISCHARGE_SCHEDULE.RESERVED.VALUE
        dischargeSchedule = Util.getShortDischargeScheduleAt @props.order.waypoints.dischargeScheduleAt

    <View>
      <View style={{ height: 32, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>주문차량</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>{ vehicleWeightCapacity } { freightBoxType }</Text>
        </View>
      </View>
      <View style={{ minHeight: 32, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', paddingTop: 8, paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>물품정보</Text>
        </View>
        <View style={{ flex: 1, paddingLeft: 10, paddingTop: 8, paddingBottom: 8 }}>
          <Text color={black} bold size={16}>{ @props.order.agentMemo }</Text>
        </View>
      </View>
      { if @props.type is 'my order'
        <View>
          <View style={{ height: 32, flexDirection: 'row' }}>
            <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
              <Text color="#444444" bold size={16}>상차일시</Text>
            </View>
            <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
              <Text color={black} bold size={16}>{ pickUpSchedule }</Text>
            </View>
          </View>
          <View style={{ height: 32, flexDirection: 'row' }}>
            <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
              <Text color="#444444" bold size={16}>하차일시</Text>
            </View>
            <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
              <Text color={black} bold size={16}>{ dischargeSchedule }</Text>
            </View>
          </View>
        </View>
      }
      <View style={{ height: 32, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>적재방법</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>{ freightLoading }</Text>
        </View>
      </View>
      <View style={{ height: 32, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>운송주선</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16} underline onPress={@onPressAgent}>{ @props.order.agent.name }</Text>
        </View>
      </View>
      <View style={{ height: 32, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={16}>결제일</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text color={black} bold size={16}>매월 4일, 25일 결제</Text>
        </View>
      </View>
      <View style={{ height: 10, flexDirection: 'row' }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf' }} />
      </View>
      { if @props.type is 'my order'
        <View>
          <View style={{ height: 43, flexDirection: 'row' }}>
            <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf' }} />
            <View style={{ flex: 1, paddingLeft: 10 }}>
              <Button onPress={@onPressPublishCashReceipt} width={170} height={32} textStyle={{ fontSize: 16 }} color="blue">고객 현금영수증 발행</Button>
            </View>
          </View>
          { if @props.order.status is @props.ORDERS.STATUS.COMPLETED.VALUE and @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
            <View style={{ height: 43, flexDirection: 'row' }}>
              <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf' }} />
              <View style={{ flex: 1, paddingLeft: 10 }}>
                <Button onPress={@onPressUploadFreightCert} width={170} height={32} textStyle={{ fontSize: 16 }} color="dark grey">화물 인수증 업로드</Button>
              </View>
            </View>
          }
          <View style={{ position: 'absolute', bottom: 10, right: 10 }}>
            <Touchable onPress={=> @onPressPhone @props.order.agent.phoneNumber}>
              <Image source={require '../../../../images/order_phone.png'} style={{ width: 42, height: 42 }} />
            </Touchable>
          </View>
        </View>
      }
    </View>
