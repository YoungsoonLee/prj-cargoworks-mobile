import SelectVehiclePopup from '../../components/SelectVehiclePopup/SelectVehiclePopup.coffee'

export default observer class UpdateVehicleView extends Component
  constructor: (props) ->
    super props

    @state = observable
      value: @props.state.value
      vehicle: ''
      isSelectVehiclePopupVisible: false
      isValid: false

    vehicle = Util.getVehicle @state.value.weight, @state.value.boxType, @props.TRANSPORTERS

    @state.vehicle = vehicle

    @state.isValid = @validate()

    reaction(
      =>
        @state.vehicle
    ,
      =>
        vehicleWeight = Util.getVehicleWeight @state.vehicle, @props.TRANSPORTERS

        @state.value.weight = vehicleWeight[1]

        @state.value.boxType = vehicleWeight[0]
    )

    reaction(
      =>
        @state.value.weight + @state.value.boxType
    ,
      =>
        vehicle = Util.getVehicle @state.value.weight, @state.value.boxType, @props.TRANSPORTERS

        @state.vehicle = vehicle
    )

    reaction(
      =>
        @validate()
    ,
      =>
        @state.isValid = @validate()
    )

    reaction(
      =>
        JSON.stringify @state.value
    ,
      =>
        @props.state.value = @state.value
    )

    reaction(
      =>
        JSON.stringify @props.state.value
    ,
      =>
        @state.value = @props.state.value
    )

  onPressSelectVehicle: =>
    @state.isSelectVehiclePopupVisible = true

  onChangeVehicle: (vehicle) =>
    @state.vehicle = vehicle

  onChangeVisible: (isVisible) =>
    @state.isSelectVehiclePopupVisible = isVisible

  onChangeImageFrame: (url) =>
    @state.value.carRegisterImageUrl = url

  validate: =>
    if not @state.value.weight
      return false

    if not @state.value.carRegisterImageUrl
      return false

    true

  onPressNext: =>
    @props.onPressNext()

  onChangeInput: (value, isValid) =>
    @state.value.carNumber = value

  render: =>
    <Layout title="차량정보">
      <SelectVehiclePopup value={@state.vehicle} isVisible={@state.isSelectVehiclePopupVisible} onChangeVisible={@onChangeVisible} onChange={@onChangeVehicle} />
      <ScrollView style={{ padding: 20 }}>
        <Text size={18} bold>운행중인 차량의 정보를 입력해 주세요.</Text>
        <Input isReuqired placeholder="차량번호를 입력해 주세요." marginTop={20} onChange={@onChangeInput} value={@state.value.carNumber} />
        { not not @state.vehicle and
          <Input placeholder="차량" isDisabled value={@state.vehicle} marginTop={20} />
          }
        <Button marginTop={20} color="blue" onPress={@onPressSelectVehicle}>차량선택</Button>
        <Text size={18} bold marginTop={45}>자동차 등록증이 잘 보이도록 사진으로 찍어 올려주세요.</Text>
        <View style={{ height: 30 }} />
        <ImageFrame url={@state.value.carRegisterImageUrl} onChange={@onChangeImageFrame} />
        <View style={{ height: 50 }} />
      </ScrollView>
      <Button isDisabled={not @state.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
