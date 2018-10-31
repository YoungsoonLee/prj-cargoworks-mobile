export default observer class OrderGetSettingView extends Component
  vehicleItemWidth: (width - 5 * 5) / 4

  renderDistances: =>
    distances = [1..50].map (distance, index) =>
      <Picker.Item key={index} value={distance} label="#{distance} km" />

    distances.unshift <Picker.Item key={-1} value={-1} label="설정안함" />

    distances

  onPressVehicle: (name) =>
    if name in @props.state.vehicles
      index = @props.state.vehicles.findIndex (vehicle) =>
        name is vehicle

      @props.state.vehicles.splice index, 1

    else
      @props.state.vehicles.push name

  renderVehicles1: =>
    vehicles = [
      '카고'
      '탑'
      '냉탑'
    ]

    weights = [
      '1톤'
      '1.4톤'
      '2.5톤'
      '3.5톤'
      '5톤'
      '5톤축'
      '8톤'
      '11톤'
      '18톤'
      '25톤'
    ]

    vehicleItems = []

    for weight in weights
      for vehicle in vehicles
        name = "#{weight} #{vehicle}"

        vehicleItems.push <Button key={name} name={name} onPress={@onPressVehicle} paddingHorizontal={0} textSize={15} color={if name in @props.state.vehicles then 'blue' else 'white'} width={@vehicleItemWidth} height={45} marginLeft={5} marginTop={5}>{ name }</Button>

    vehicleItems

  renderVehicles0: =>
    vehicles = [
      '오토바이'
      '다마스'
      '라보'
      '밴'
    ]

    vehicles.map (vehicle, index) =>
      <Button key={index} name={vehicle} onPress={@onPressVehicle} paddingHorizontal={0} textSize={15} color={if vehicle in @props.state.vehicles then 'blue' else 'white'} width={@vehicleItemWidth} height={45} marginLeft={5} marginTop={5}>{ vehicle }</Button>

  onChangeSelect: (value, name) =>
    @props.state[name] = value

  onPressSave: =>
    @props.onPressSave()

  render: =>
    <Layout title="주문수신 설정">
      <ScrollView>
        <View style={{ borderBottomWidth: 1, borderBottomColor: black, height: 65, backgroundColor: '#eeeeee', justifyContent: 'center', paddingLeft: 10 }}>
          <Text bold size={15} color={black}>주문을 수신할 최대 거리를 설정하세요.</Text>
          <Text size={15}>설정값의 km 내 주문을 수신합니다.</Text>
        </View>
        <View style={{ paddingHorizontal: 30 }}>
          <Select label="최대거리" value={@props.state.distance} onChange={@onChangeSelect} name="distance">
            { @renderDistances() }
          </Select>
        </View>
        <View style={{ borderBottomWidth: 1, borderBottomColor: black, borderTopWidth: 1, borderTopColor: black, height: 65, backgroundColor: '#eeeeee', justifyContent: 'center', paddingLeft: 10 }}>
          <Text bold size={15} color={black}>주문을 수신할 차량을 선택하세요.</Text>
          <Text size={15}>복수 선택이 가능합니다.</Text>
        </View>
        <View style={{ flexDirection: 'row', flexWrap: 'wrap', marginRight: 5, paddingBottom: 5 }}>
          { @renderVehicles0() }
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: @vehicleItemWidth * 3 + 5 * 3, flexDirection: 'row', flexWrap: 'wrap' }}>
              { @renderVehicles1() }
            </View>
            <View style={{ flex: 1, justifyContent: 'flex-end' }}>
              <Button name="추레라" onPress={@onPressVehicle} paddingHorizontal={0} textSize={15} color={if '추레라' in @props.state.vehicles then 'blue' else 'white'} width={@vehicleItemWidth} height={45} marginLeft={5} marginTop={5}>추레라</Button>
            </View>
          </View>
        </View>
        <View style={{ borderTopWidth: 1, borderTopColor: black, height: 40, backgroundColor: '#eeeeee', justifyContent: 'center', paddingLeft: 10 }}>
          <Text bold size={15} color={black}>소속 운송주선사 주문만 보기</Text>
        </View>
        <View style={{ borderTopWidth: 1, borderTopColor: black, flexDirection: 'row', height: 55 }}>
          <View style={{ width: 70, alignItems: 'center', justifyContent: 'center' }}>
            <Switch state={@props.state} path="isOnlyMyAgentOrder" />
          </View>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={13}>
              소속된 운송주선사 또는 퀵사의 주문만 보는 기능입니다.{'\n'}
              켜 놓으시면 다른 공유주문은 볼 수 없습니다.
            </Text>
          </View>
        </View>
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>저장하기</Button>
    </Layout>
