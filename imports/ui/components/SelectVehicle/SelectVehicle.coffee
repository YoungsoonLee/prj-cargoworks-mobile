export default observer class SelectVehicle extends Component
  # 이 component는 db schema와 상관없이 만들어졌고 넘겨받은 state의 path에 선택된 항목들을 string array형태로 담아서 준다
  # string array로 가능한 value는 다음과 같다
  # '오토바이', '다마스', '라보', '밴'
  # '1톤 카고', '1.4톤 카고', '2.5톤 카고', '3.5톤 카고', '5톤 카고', '5톤축 카고', '8톤 카고', '11톤 카고', '18톤 카고', '25톤 카고'
  # 탑, 냉탑도 마찬가지
  # 마지막으로 '추레라'

  # @propTypes:
  #   isSwitch: PropTypes.bool

  @defaultProps:
    isSwitch: false

  vehicleItemWidth: (width - 5 * 5) / 4

  onPressVehicle: (name) =>
    if @props.isSwitch
      _set @props.state, @props.vehiclesPath, [name]

    else
      if name in _get @props.state, @props.vehiclesPath
        vehicles = _get @props.state, @props.vehiclesPath

        index = vehicles.findIndex (vehicle) =>
          name is vehicle

        splice @props.state, @props.vehiclesPath, index, 1

      else
        push @props.state, @props.vehiclesPath, name

  renderVehicles0: =>
    vehicles = [
      '오토바이'
      '다마스'
      '라보'
      '밴'
    ]

    vehicles.map (vehicle, index) =>
      <Button key={index} name={vehicle} onPress={@onPressVehicle} paddingHorizontal={0} textSize={15} color={if vehicle in _get @props.state, @props.vehiclesPath then 'blue' else 'white'} width={@vehicleItemWidth} height={45} marginLeft={5} marginTop={5}>{ vehicle }</Button>

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

        vehicleItems.push <Button key={name} name={name} onPress={@onPressVehicle} paddingHorizontal={0} textSize={15} color={if name in _get @props.state, @props.vehiclesPath then 'blue' else 'white'} width={@vehicleItemWidth} height={45} marginLeft={5} marginTop={5}>{ name }</Button>

    vehicleItems

  render: =>
    <View style={{ flexDirection: 'row', flexWrap: 'wrap', marginRight: 5, paddingBottom: 5 }}>
      { @renderVehicles0() }
      <View style={{ flexDirection: 'row' }}>
        <View style={{ width: @vehicleItemWidth * 3 + 5 * 3, flexDirection: 'row', flexWrap: 'wrap' }}>
          { @renderVehicles1() }
        </View>
        <View style={{ flex: 1, justifyContent: 'flex-end' }}>
          <Button name="추레라" onPress={@onPressVehicle} paddingHorizontal={0} textSize={15} color={if '추레라' in _get @props.state, @props.vehiclesPath then 'blue' else 'white'} width={@vehicleItemWidth} height={45} marginLeft={5} marginTop={5}>추레라</Button>
        </View>
      </View>
    </View>
