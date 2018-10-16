export default observer class OrderDetailLayoutView extends Component
  # @propTypes:
  #   order: PropTypes.object
  #   type: PropTypes.oneOf ['order', 'my order']

  @defaultProps:
    order: {}
    type: 'order'

  render: =>
    <View style={{ flex: 1 }}>
      <View style={{ height: 50, backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: lightBlue, justifyContent: 'center', alignItems: 'center', flexDirection: 'row' }}>
        <Text bold size={20} color={yellow}>{ Util.getFormattedPrice @props.order.agentFare.final }원</Text>
        { if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
          <Badge marginLeft={8} badgeColor={yellow} textColor={black}>수</Badge>
        }
        { if @props.order.vehicleType is @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE
          <Text marginLeft={8} bold size={18} color={yellow}>{ Util.getFormattedPrice @props.order.agentFare.agentFee }</Text>
        }
        { if @props.order.agentFare.isExpress
          <>
            <Text marginLeft={8} bold size={20} color="#76eaa0">급송</Text>
            <Text marginLeft={8} bold size={20} color="#8987ce">|</Text>
          </>
        }
        { if @props.order.agentFare.isMixedFreight
          <>
            <Text marginLeft={8} bold size={20} color="#76eaa0">혼적</Text>
            <Text marginLeft={8} bold size={20} color="#8987ce">|</Text>
          </>
        }
        { if @props.order.paymentMethod is @props.ORDERS.PAYMENT_METHODS.MONTHLY.VALUE
          <Text marginLeft={8} bold size={20} color="#71d5ff">신용</Text>
        }
        { if @props.order.paymentMethod is @props.ORDERS.PAYMENT_METHODS.PREPAYMENT.VALUE
          <Text marginLeft={8} bold size={20} color="#71d5ff">선불</Text>
        }
        { if @props.order.paymentMethod is @props.ORDERS.PAYMENT_METHODS.ON_DELIVERY.VALUE
          <Text marginLeft={8} bold size={20} color="#71d5ff">착불</Text>
        }
      </View>
      <View style={{ flex: 1 }}>
        { @props.children }
      </View>
      <View style={{ flexDirection: 'row', height: 60, backgroundColor: darkBlue }}>
        <View style={{ flex: 1, flexDirection: 'row', alignItems: 'center', paddingLeft: 5 }}>
          <Text bold size={15} color={white}>거리</Text>
          <Text marginLeft={8} bold size={15} color={yellow}>{ Util.convertMetersToKilos @props.order.waypoints.distance } km</Text>
          <Text marginLeft={8} bold size={15} color="#8987ce">|</Text>
          <Text marginLeft={8} bold size={15} color={white}>예상운행시간</Text>
          <Text marginLeft={8} bold size={15} color={yellow}>{ parseInt(@props.order.waypoints.estimatedTime / 60) }분</Text>
        </View>
        <View style={{ width: 120, justifyContent: 'center', alignItems: 'center', flexDirection: 'row' }}>
          <Button paddingHorizontal={0} buttonColor={white} width={85} height={35}>
            <View style={{ flexDirection: 'row' }}>
              <Text size={15} color={black}>지도보기</Text>
              <Image source={require '../../../../images/marker.png'} style={{ marginLeft: 3, width: 10, height: 14 }} />
            </View>
          </Button>
          { @props.type is 'my order' and 1 is 2 and
            <Button paddingHorizontal={0} buttonColor={white} width={50} height={35} marginLeft={5}>
              <View style={{ flexDirection: 'row' }}>
                <Text size={15} color={black}>티맵</Text>
                <Image source={require '../../../../images/tmap.png'} style={{ marginLeft: 1, width: 13, height: 14 }} />
              </View>
            </Button>
            }
        </View>
      </View>
    </View>
