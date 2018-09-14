export default observer class Order extends Component
  # @propTypes:
  #   order: PropTypes.object
  #   onPress: PropTypes.func

  @defaultProps:
    order: {}
    onPress: =>

  onPress: =>
    @props.onPress()

  render: =>
    if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE
      type = 'parcel'

    else if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
      type = 'frieght'

    _distance = Util.getDistance @props.transporter.currentGeoLocation.longitude, @props.transporter.currentGeoLocation.latitude, @props.order.waypoints.addresses[0].tmap.longitude, @props.order.waypoints.addresses[0].tmap.latitude

    distance = Util.convertMetersToKilos _distance, 0

    isImmediate = @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.IMMEDIATE.VALUE

    startAddress = "#{@props.order.waypoints.addresses[0].daum.sido or ''} #{@props.order.waypoints.addresses[0].daum.sigugun or ''}"

    endAddress = "#{@props.order.waypoints.addresses[@props.order.waypoints.addresses.length - 1].daum.sido or ''} #{@props.order.waypoints.addresses[@props.order.waypoints.addresses.length - 1].daum.sigugun or ''}"

    waypointsLegth = @props.order.waypoints.addresses.length - 2

    isRoundTrip = @props.order.waypoints.isRoundTrip

    vehicleType = Util.getShortVehicleType @props.order.vehicleWeightCapacity, @props.order.freightBoxType, @props.TRANSPORTERS

    weight = Util.getShortWeight @props.order.vehicleWeightCapacity, @props.order.freightBoxType, @props.TRANSPORTERS

    fare = Util.getShortPrice @props.order.agentFare.final, 0

    fee = Util.getShortPrice @props.order.agentFare.agentFee, 0

    if @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.IMMEDIATE.VALUE
      pickUpScheduledAt = '즉시'

    else if @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.RESERVED.VALUE
      pickUpScheduledAt = Util.getShortPickUpScheduledAt @props.order.waypoints.pickUpScheduledAt

    if @props.order.waypoints.dischargeSchedule is @props.ORDERS.DISCHARGE_SCHEDULE.SAME_DAY.VALUE
      dischargeScheduleAt = '당일'

    else if @props.order.waypoints.dischargeSchedule is @props.ORDERS.DISCHARGE_SCHEDULE.NEXT_DAY.VALUE
      dischargeScheduleAt = '익일'

    else if @props.order.waypoints.dischargeSchedule is @props.ORDERS.DISCHARGE_SCHEDULE.RESERVED.VALUE
      dischargeScheduleAt = Util.getShortDischargeScheduleAt @props.order.waypoints.dischargeScheduleAt

    memo = @props.order.agentMemo

    isExpress = @props.order.agentFare.isExpress

    if @props.order.paymentMethod is @props.ORDERS.PAYMENT_METHODS.MONTHLY.VALUE
      paymentMethod = '신용'

      paymentMethodColor = '#3f73b4'

    else if @props.order.paymentMethod is @props.ORDERS.PAYMENT_METHODS.PREPAYMENT.VALUE
      paymentMethod = '선불'

      paymentMethodColor = '#2a9160'

    else if @props.order.paymentMethod is @props.ORDERS.PAYMENT_METHODS.ON_DELIVERY.VALUE
      paymentMethod = '착불'

      paymentMethodColor = '#2a9160'

    if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.IN_HOUSE.VALUE
      backgroundColor = lightYellow

    else if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.EXCLUSIVE.VALUE
      backgroundColor = '#eafcfe'

    else
      backgroundColor = white

    if type is 'parcel'
      return (
        <Touchable onPress={@onPress}>
          <View style={{ flexDirection: 'row', height: 50, backgroundColor: backgroundColor, borderRadius: 3, marginTop: 1 }}>
            <View style={{ zIndex: 1, width: 21, height: 21, backgroundColor: darkBlue, borderRadius: 3, position: 'absolute', top: 13, left: '41%', alignItems: 'center', justifyContent: 'center' }}>
              <Text color="#ffffff" size={10} bold>+{ waypointsLegth }</Text>
              { if isRoundTrip
                <Image source={require '../../../../images/round_trip.png'} style={{ width: 12 * 1.3, height: 7 * 1.3 }} />
              }
            </View>
            <View style={{ overflow: 'hidden', borderRightWidth: 1, borderRightColor: '#cccccc', width: 40, justifyContent: 'center', paddingLeft: 8 }}>
              <Text bold size={20} color={black}>{ distance }</Text>
            </View>
            <View style={{ flexDirection: 'row', borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, alignItems: 'center', paddingLeft: 5 }}>
              { if not isImmediate
                <EvilIcons name="clock" color={black} size={27} style={{ marginRight: 2 }} />
              }
              <Text bold size={22} color={black}>{ startAddress.slice 0, 5 }</Text>
            </View>
            <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 15 }}>
              <Text bold size={22} color={black}>{ endAddress.slice 0, 5 }</Text>
            </View>
            <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, alignItems: 'center', justifyContent: 'center' }}>
              <Text bold size={20} color={black}>{ vehicleType }</Text>
            </View>
            <View style={{ width: 47, alignItems: 'flex-end', justifyContent: 'center', paddingRight: 6 }}>
              <Text bold size={20} color={darkRed}>{ fare }</Text>
            </View>
          </View>
        </Touchable>
      )

    else if type is 'frieght'
      return (
        <Touchable onPress={@onPress}>
          <View style={{ flexDirection: 'row', height: 100, backgroundColor: backgroundColor, borderRadius: 3, marginTop: 1 }}>
            <View style={{ zIndex: 1, width: 21, height: 21, backgroundColor: darkBlue, borderRadius: 3, position: 'absolute', top: 10, left: '41%', alignItems: 'center', justifyContent: 'center' }}>
              <Text color="#ffffff" size={10} bold>+{ waypointsLegth }</Text>
              { if isRoundTrip
                <Image source={require '../../../../images/round_trip.png'} style={{ width: 12 * 1.3, height: 7 * 1.3 }} />
              }
            </View>
            <View style={{ overflow: 'hidden', borderRightWidth: 1, borderRightColor: '#cccccc', width: 40, paddingTop: 8, paddingLeft: 8 }}>
              <Text bold size={20} color={black}>{ distance }</Text>
            </View>
            <View style={{ flex: 1 }}>
              <View style={{ height: 66, flexDirection: 'row' }}>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 5 }}>
                  <Text bold size={22} color={black}>{ startAddress.slice 0, 5 }</Text>
                  <Text bold size={17} color="#375ab5" marginTop={2}>{ pickUpScheduledAt }</Text>
                </View>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 15 }}>
                  <Text bold size={22} color={black}>{ endAddress.slice 0, 5 }</Text>
                  <Text bold size={17} color="#375ab5" marginTop={2}>{ dischargeScheduleAt }</Text>
                </View>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, alignItems: 'center', justifyContent: 'center' }}>
                  <Text bold size={20} color={black}>{ weight }</Text>
                  <Text size={17} color={black} marginTop={5}>{ vehicleType }</Text>
                </View>
                <View style={{ width: 47, alignItems: 'flex-end', justifyContent: 'center', paddingRight: 6 }}>
                  <Text bold size={20} color={darkRed}>{ fare }</Text>
                  <Text size={17} color={black} marginTop={5}>({ fee })</Text>
                </View>
              </View>
              <View style={{ height: 34, flexDirection: 'row', borderTopWidth: 1, borderTopColor: '#cccccc' }}>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 5 }}>
                  <Text color="#555555" size={17}>{ memo }</Text>
                </View>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, alignItems: 'center', justifyContent: 'center' }}>
                  { if isExpress
                    <Badge badgeColor="#c12d3a">급송</Badge>
                  }
                </View>
                <View style={{ width: 47, alignItems: 'center', justifyContent: 'center' }}>
                  <Badge badgeColor={paymentMethodColor}>{ paymentMethod }</Badge>
                </View>
              </View>
            </View>
          </View>
        </Touchable>
      )
