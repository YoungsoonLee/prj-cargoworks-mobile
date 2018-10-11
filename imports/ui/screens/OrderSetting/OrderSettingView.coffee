export default observer class OrderSettingView extends Component
  onPressMenuItem: (menuItem) =>
    @props.onPressMenuItem menuItem

  renderMenuItems: =>
    @props.menuItems.map (menuItem, index) =>
      <Touchable key={index} onPress={=> @onPressMenuItem menuItem}>
        <View style={{ marginTop: (if index is 0 then 0 else 5), height: 80, flexDirection: 'row', borderWidth: 1, borderColor: '#cccccc', borderRadius: 3 }}>
          <View style={{ width: 55, alignItems: 'center', justifyContent: 'center' }}>
            { menuItem.icon }
          </View>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={22} bold color={black}>{ menuItem.title }</Text>
          </View>
          <View style={{ width: 50, alignItems: 'center', justifyContent: 'center' }}>
            <Ionicons name="ios-arrow-forward" size={25} />
          </View>
        </View>
      </Touchable>

  onPressInOrOut: (isIn) =>
    @props.onPressInOrOut isIn

  render: =>
    <View style={{ flex: 1, backgroundColor: white }}>
      <View style={{ borderBottomWidth: 1, borderBottomColor: black, height: 50, backgroundColor: '#eeeeee', alignItems: 'center', justifyContent: 'center', flexDirection: 'row' }}>
        <Text bold size={15} color={black}>출퇴근 설정</Text>
        <Text size={15} marginLeft={10}>출근중에는 주문이 실시간으로 수신됩니다.</Text>
      </View>
      { if @props.transporter.operationStatus is @props.TRANSPORTERS.OPERATION_STATUS.OUT.VALUE
        <View style={{ height: 80, flexDirection: 'row', alignItems: 'center', justifyContent: 'center' }}>
          <Text bold size={22} color="#666666">주문 수신 꺼짐...</Text>
          <Image source={require '../../../../images/truck.png'} style={{ marginLeft: 2, width: 26, height: 18 }} />
        </View>
      }
      { if @props.transporter.operationStatus is @props.TRANSPORTERS.OPERATION_STATUS.IN.VALUE
        <View style={{ height: 80, flexDirection: 'row', alignItems: 'center', justifyContent: 'center' }}>
          <Text bold size={22} color="#c12d3a">주문 수신 중...</Text>
          <Image source={require '../../../../images/truck_red.png'} style={{ marginLeft: 2, width: 40, height: 31, marginTop: -11 }} />
        </View>
      }
      <ScrollView style={{ paddingHorizontal: 10 }}>
        { @renderMenuItems() }
        <View style={{ height: 100 }} />
      </ScrollView>
      { if @props.transporter.operationStatus is @props.TRANSPORTERS.OPERATION_STATUS.OUT.VALUE
        <Button onPress={=> @onPressInOrOut true} borderRadius={0} height={75} color="light blue">
          <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <Image source={require '../../../../images/enter.png'} style={{ width: 22, height: 16 }} />
            <Text bold marginLeft={5} color={white} size={20}>출근하기</Text>
          </View>
        </Button>
      }
      { if @props.transporter.operationStatus is @props.TRANSPORTERS.OPERATION_STATUS.IN.VALUE
        <Button onPress={=> @onPressInOrOut false} borderRadius={0} height={75} color="grey">
          <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <Image source={require '../../../../images/out.png'} style={{ width: 22, height: 16 }} />
            <Text bold marginLeft={5} color={white} size={20}>퇴근하기</Text>
          </View>
        </Button>
      }
    </View>
