export default observer class MyOrderDetail extends Component
  # @propTypes:
  #   order: PropTypes.object

  @defaultProps:
    order: {}

  onPressOk: =>
    Util.back()

    setTimeout =>
      Util.og 'MyOrders'
    , 500

  renderWayPoints: =>
    wayPoints = [0..5]

    wayPoints.map (wayPoint) =>
      <View style={{ height: 65, flexDirection: 'row', borderTopWidth: 1, borderTopColor: black }}>
        <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
          <Text color="#444444" bold size={22}>출발</Text>
          <Text color="#444444" size={17}>3.7km</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
          <Text bold size={20} color={black}>경기도 성남시 분당구 삼평동 544</Text>
          <Text marginTop={3} bold size={17} color="#375ab5">즉시</Text>
        </View>
      </View>

  render: =>
    <View style={{ flex: 1 }}>
      <View style={{ height: 50, backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: lightBlue, justifyContent: 'center', alignItems: 'center', flexDirection: 'row' }}>
        <Text bold size={20} color={yellow}>225.000원</Text>
        <Badge marginLeft={8} badgeColor={yellow} textColor={black}>수</Badge>
        <Text marginLeft={8} bold size={18} color={yellow}>25,000</Text>
        <Text marginLeft={8} bold size={20} color="#76eaa0">혼적</Text>
        <Text marginLeft={8} bold size={20} color="#8987ce">|</Text>
        <Text marginLeft={8} bold size={20} color="#71d5ff">혼적</Text>
      </View>
      <View style={{ height: 40, backgroundColor: lightYellow, justifyContent: 'center', alignItems: 'center' }}>
        <Text color={black}>전담거래처 주문입니다.</Text>
      </View>
      <ScrollView>
        { @renderWayPoints() }
        <View style={{ height: 40, flexDirection: 'row', borderTopWidth: 1, borderTopColor: black }}>
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
            <Text color={black} bold size={16}>빠르다로지스</Text>
          </View>
        </View>
        <View style={{ height: 40, flexDirection: 'row', borderBottomWidth: 1, borderBottomColor: black }}>
          <View style={{ width: 85, borderRightWidth: 1, borderRightColor: '#a2aabf', justifyContent: 'center', paddingLeft: 10 }}>
            <Text color="#444444" bold size={16}>결제일</Text>
          </View>
          <View style={{ flex: 1, justifyContent: 'center', paddingLeft: 10 }}>
            <Text color={black} bold size={16}>매월 4일, 25일 결제</Text>
          </View>
        </View>
      </ScrollView>
      <View style={{ flexDirection: 'row', height: 60, backgroundColor: darkBlue }}>
        <View style={{ flex: 1, flexDirection: 'row', alignItems: 'center', paddingLeft: 5 }}>
          <Text bold size={15} color={white}>거리</Text>
          <Text marginLeft={8} bold size={15} color={yellow}>432.8 km</Text>
          <Text marginLeft={8} bold size={15} color="#8987ce">|</Text>
          <Text marginLeft={8} bold size={15} color={white}>예상운행시간</Text>
          <Text marginLeft={8} bold size={15} color={yellow}>136분</Text>
        </View>
        <View style={{ width: 100, justifyContent: 'center', alignItems: 'center' }}>
          <Button buttonColor={white} width={85} height={35}>
            <View style={{ flexDirection: 'row' }}>
              <Text size={15} color={black}>지도보기</Text>
              <Image source={require '../../../../images/marker.png'} style={{ marginLeft: 3, width: 10, height: 14 }} />
            </View>
          </Button>
        </View>
      </View>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressOk}>
        <View style={{ flexDirection: 'row' }}>
          <Feather name="check" size={25} color={white} marginTop={-3} />
          <Text bold marginLeft={5} color={white} size={20}>수락하기</Text>
        </View>
      </Button>
    </View>
