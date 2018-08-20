import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class OrderSetting extends Component
  onPressMenuTime: (screen) =>
    Util.go screen

  renderMenuItems: =>
    menuItems = [
      icon: <Image source={require '../../../../images/wifi.png'} style={{ width: 20, height: 20 }} />
      title: '주문수신설정'
      screen: 'OrderGetSetting'
    ,
      icon: <Image source={require '../../../../images/block.png'} style={{ width: 20, height: 20 }} />
      title: '공차,혼적 등록'
      screen: 'EmptySetting'
    ,
      icon: <Image source={require '../../../../images/map.png'} style={{ width: 20, height: 20 }} />
      title: '지역현황'
      screen: 'Regions'
    ,
      icon: <Image source={require '../../../../images/love.png'} style={{ width: 20, height: 20 }} />
      title: '전담거래처'
      screen: 'MyAgents'
    ]

    menuItems.map (menuItem, index) =>
      <Touchable key={index} onPress={=> @onPressMenuTime menuItem.screen}>
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

  render: =>
    <View style={{ flex: 1, backgroundColor: white }}>
      <View style={{ borderBottomWidth: 1, borderBottomColor: black, height: 50, backgroundColor: '#eeeeee', alignItems: 'center', justifyContent: 'center', flexDirection: 'row' }}>
        <Text bold size={15} color={black}>출퇴근 설정</Text>
        <Text size={15} marginLeft={10}>출근중에는 주문이 실시간으로 수신됩니다.</Text>
      </View>
      { 1 is 2 and
        <View style={{ height: 70, flexDirection: 'row', alignItems: 'center', justifyContent: 'center' }}>
          <Text bold size={22} color="#666666">주문 수신 꺼짐...</Text>
          <Image source={require '../../../../images/truck.png'} style={{ marginLeft: 2, width: 26, height: 18 }} />
        </View>
        }
      { 1 is 1 and
        <View style={{ height: 80, flexDirection: 'row', alignItems: 'center', justifyContent: 'center' }}>
          <Text bold size={22} color="#c12d3a">주문 수신 중...</Text>
          <Image source={require '../../../../images/truck_red.png'} style={{ marginLeft: 2, width: 40, height: 31, marginTop: -11 }} />
        </View>
        }
      <ScrollView style={{ paddingHorizontal: 10 }}>
        { @renderMenuItems() }
        <View style={{ height: 100 }} />
      </ScrollView>
      { 1 is 2 and
        <Button borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>
          <View style={{ flexDirection: 'row' }}>
            <Image source={require '../../../../images/enter.png'} style={{ width: 22, height: 16 }} />
            <Text bold marginLeft={5} color={white} size={20}>출근하기</Text>
          </View>
        </Button>
        }
      { 1 is 1 and
        <Button borderRadius={0} height={75} color="grey" onPress={@onPressSave}>
          <View style={{ flexDirection: 'row' }}>
            <Image source={require '../../../../images/out.png'} style={{ width: 22, height: 16 }} />
            <Text bold marginLeft={5} color={white} size={20}>퇴근하기</Text>
          </View>
        </Button>
        }
    </View>
