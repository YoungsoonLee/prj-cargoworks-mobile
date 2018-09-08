import { Linking } from 'react-native'

export default observer class WayPoints extends Component
  # @propTypes:
  #   type: PropTypes.oneOf ['order', 'my order']
  #   order: PropTypes.object
  #   ORDERS: PropTypes.object
  #   transporter: PropTypes.object
  #   TRANSPORTERS: PropTypes.object
  #   orderInfo: PropTypes.element
  #
  # to David: orderInfo는 주문정보를 뜻하는데 웨이 포인트가 서명을 받을 때마다
  # 다음 단계로 넘어가면서 주문 정보가 바로 밑에 렌더링 되게 하기 위해 orderInfo elemnet를 받는다

  @defaultProps:
    type: ''
    order: {}
    ORDERS: {}
    transporter: {}
    TRANSPORTERS: {}
    orderInfo: <View />

  onPressPhone: (phoneNumber) =>
    phoneNumber = '01042342341'

    Util.confirm "#{phoneNumber}로 전화 하시겠습니까?", =>
      Linking.openURL "tel:#{phoneNumber}"

  renderWayPoints: =>
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

    waypoints.map (waypoint, index) =>
      if index is 0
        label = '출발'

      else if index is waypoints.length - 1
        label = '도착'

      else
        label = "경유#{index}"

      currentGeoLocation = @props.transporter.currentGeoLocation

      if index is 0
        distance = Util.getDistance currentGeoLocation.longitude, currentGeoLocation.latitude, waypoint.tmap.longitude, waypoint.tmap.latitude

      else
        distance = waypoint.distance

      if @props.type is 'order'
        return (
          <View key={waypoint.id} style={{ height: 65, flexDirection: 'row', borderTopWidth: 1, borderTopColor: black, borderBottomWidth: (if index is waypoints.length - 1 then 1 else 0), borderBottomColor: black }}>
            <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
              <Text color="#444444" bold size={22}>{ label }</Text>
              <Text color="#444444" size={17}>{ Util.convertMetersToKilos distance }km</Text>
            </View>
            <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
              <Text bold size={20} color={black}>{ waypoint.daum.autoJibunAddress or waypoint.daum.address }</Text>
              { if index is 0 and not not pickUpSchedule
                <Text marginTop={3} bold size={17} color="#375ab5">{ pickUpSchedule }</Text>
              }
              { if index is waypoints.length - 1 and not not dischargeSchedule
                <Text marginTop={3} bold size={17} color="#375ab5">{ dischargeSchedule }</Text>
              }
            </View>
          </View>
        )

      else if @props.type is 'my order'
        return (
          <View key={index}>
            <View style={{ flexDirection: 'row', borderBottomWidth: (if index is waypoints.length - 1 or waypoint.isActive = true then 1 else 0), borderBottomColor: black, borderTopWidth: 1, borderTopColor: black }}>
              <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', paddingTop: 12, paddingLeft: 10 }}>
                <Text color="#444444" bold size={22}>출발</Text>
                <Text color="#444444" size={17}>3.7km</Text>
              </View>
              <View style={{ flex: 1, padding: 10 }}>
                <Text bold size={20} color={black}>경기도 성남시 분당구 삼평동 544</Text>
                <Text bold size={20} color={black}>김배달</Text>
                <Text bold size={17} color={black} marginTop={10}>박스 3개만 전달</Text>
                <View style={{ flexDirection: 'row', alignItems: 'center', marginTop: 10 }}>
                  <Button paddingHorizontal={0} color="blue" width={50} height={25} textSize={14}>서명</Button>
                  <Text color={blue} size={14} bold marginLeft={10}>14:20</Text>
                </View>
              </View>
              <View style={{ width: 60, justifyContent: 'flex-end', paddingBottom: 10, alignItems: 'center' }}>
                <Touchable onPress={@onPressPhone}>
                  <Image source={require '../../../../images/order_phone.png'} style={{ width: 42, height: 42 }} />
                </Touchable>
              </View>
            </View>
            { waypoint.isActive = true and @props.orderInfo }
          </View>
        )

  render: =>
    <View>
      { @renderWayPoints() }
    </View>
