import { Linking } from 'react-native'

export default observer class WayPoints extends Component
  # @propTypes:
  #   type: PropTypes.oneOf ['order', 'my order']
  #   order: PropTypes.object
  #   ORDERS: PropTypes.object
  #   transporter: PropTypes.object
  #   TRANSPORTERS: PropTypes.object
  #   orderInfo: PropTypes.element

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

  renderWaypoints: =>
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

      if @props.type is 'order'
        if index is 0
          distance = Util.getDistance currentGeoLocation.longitude, currentGeoLocation.latitude, waypoint.tmap.longitude, waypoint.tmap.latitude

        else
          distance = waypoint.distance

      else if @props.type is 'my order'
        distance = Util.getDistance currentGeoLocation.longitude, currentGeoLocation.latitude, waypoint.tmap.longitude, waypoint.tmap.latitude

      isActive = waypoint.isActive

      if @props.type is 'order'
        backgroundColor = white

      else if @props.type is 'my order'
        if isActive
          backgroundColor = '#fffae1'

        else
          backgroundColor = '#e5e5e5'

      if index is waypoints.length - 1
        isLastWaypoint = true

      else
        isLastWaypoint = false

      <View key={waypoint.id}>
        <View style={{ backgroundColor: backgroundColor, flexDirection: 'row', borderTopWidth: 1, borderTopColor: black, borderBottomWidth: (if index is waypoints.length - 1 then 1 else 0), borderBottomColor: black }}>
          <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
            <Text color="#444444" bold size={22}>{ label }</Text>
            { if @props.type is 'order' or @props.type is 'my order' and isActive
              <Text color="#444444" size={17}>{ Util.convertMetersToKilos distance }km</Text>
            }
          </View>
          <View style={{ minHeight: 65, paddingTop: 10, paddingBottom: 10, flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
            <Text bold size={20} color={black}>{ waypoint.daum.autoJibunAddress or waypoint.daum.address }</Text>
            { if @props.type is 'order'
              <View>
                { if index is 0 and not not pickUpSchedule
                  <Text marginTop={3} bold size={17} color="#375ab5">{ pickUpSchedule }</Text>
                }
                { if index is waypoints.length - 1 and not not dischargeSchedule
                  <Text marginTop={3} bold size={17} color="#375ab5">{ dischargeSchedule }</Text>
                }
              </View>
            }
            { if @props.type is 'my order'
              <View>
                <Text bold size={20} color={black}>{ waypoint.contactName }</Text>
                { if waypoint.unloadDetail
                  <Text bold size={17} color={black} marginTop={10}>{ waypoint.unloadDetail }</Text>
                }
                { if waypoint.isSignedOff
                  <View style={{ flexDirection: 'row', alignItems: 'center', marginTop: 10 }}>
                    <Button paddingHorizontal={0} color="blue" width={50} height={25} textSize={14}>서명</Button>
                    <Text color={blue} size={14} bold marginLeft={10}>{ moment(waypoint.signedOffAt).format('HH:mm') }</Text>
                  </View>
                }
              </View>
            }
          </View>
          { if @props.type is 'my order'
            <View style={{ width: 60, justifyContent: 'flex-end', paddingBottom: 10, alignItems: 'center' }}>
              { if isActive or waypoint.isSignedOff
                <Touchable onPress={=> @onPressPhone waypoint.contactPhoneNumber}>
                  <Image source={require '../../../../images/order_phone.png'} style={{ width: 42, height: 42 }} />
                </Touchable>
              else
                <Image source={require '../../../../images/order_phone_grey.png'} style={{ width: 42, height: 42 }} />
              }
            </View>
          }
        </View>
        { if @props.type is 'my order' and isActive
          <View style={{ borderTopWidth: 1, borderTopColor: black }} />
        }
        { if @props.type is 'my order' and (isActive or isLastWaypoint)
          @props.orderInfo
        }
        { if @props.type is 'my order' and isLastWaypoint
          <View style={{ borderTopWidth: 1, borderTopColor: black }} />
        }
      </View>

  render: =>
    <View>
      { @renderWaypoints() }
    </View>
