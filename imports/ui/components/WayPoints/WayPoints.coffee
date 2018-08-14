import { Linking } from 'react-native'

export default observer class WayPoints extends Component
  # @propTypes:
  #   type: PropTypes.oneOf ['order', 'my order']
  #   orderInfo: PropTypes.element
  #
  # to David: orderInfo는 주문정보를 뜻하는데 웨이 포인트가 서명을 받을 때마다
  # 다음 단계로 넘어가면서 주문 정보가 바로 밑에 렌더링 되게 하기 위해 orderInfo elemnet를 받는다

  @defaultProps:
    type: ''
    orderInfo: <View />

  onPressPhone: (phoneNumber) =>
    phoneNumber = '01042342341'

    Util.confirm "#{phoneNumber}로 전화 하시겠습니까?", =>
      Linking.openURL "tel:#{phoneNumber}"

  renderWayPoints: =>
    wayPoints = [0..5]

    wayPoints.map (wayPoint, index) =>
      if @props.type is 'order'
        return (
          <View key={index} style={{ height: 65, flexDirection: 'row', borderTopWidth: 1, borderTopColor: black, borderBottomWidth: (if index is wayPoints.length - 1 then 1 else 0), borderBottomColor: black }}>
            <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
              <Text color="#444444" bold size={22}>출발</Text>
              <Text color="#444444" size={17}>3.7km</Text>
            </View>
            <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
              <Text bold size={20} color={black}>경기도 성남시 분당구 삼평동 544</Text>
              <Text marginTop={3} bold size={17} color="#375ab5">즉시</Text>
            </View>
          </View>
        )

      else if @props.type is 'my order'
        return (
          <View key={index}>
            <View style={{ flexDirection: 'row', borderBottomWidth: (if index is wayPoints.length - 1 or wayPoint.isActive = true then 1 else 0), borderBottomColor: black, borderTopWidth: 1, borderTopColor: black }}>
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
            { wayPoint.isActive = true and @props.orderInfo }
          </View>
        )

  render: =>
    <View>
      { @renderWayPoints() }
    </View>
