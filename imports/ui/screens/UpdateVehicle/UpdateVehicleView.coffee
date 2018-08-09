import SelectVehiclePopup from '../../components/SelectVehiclePopup/SelectVehiclePopup.coffee'

export default observer class UpdateVehicleView extends Component
  constructor: (props) ->
    super props

    @state = observable
      carNumber: ''
      isCarNumberValid: false
      weight: null
      boxType: null
      isSelectVehiclePopupVisible: false
      url: ''
      isValid: false

    reaction(
      =>
        @validate()
    ,
      =>
        @state.isValid = @validate()
    )

  onPressSelectVehicle: =>
    @state.isSelectVehiclePopupVisible = true

  onChangeVehicle: (weight, boxType) =>
    @state.weight = weight

    @state.boxType = boxType

  onChangeVisible: (isVisible) =>
    @state.isSelectVehiclePopupVisible = isVisible

  onChangeImageFrame: (url) =>
    @state.url = url

  validate: =>
    if not @state.isCarNumberValid
      return false

    if not @state.weight
      return false

    if not @state.url
      return false

    true

  onPressNext: =>
    Util.go 'UpdateInsurance'

  onChangeInput: (value, isValid) =>
    @state.carNumber = value

    @state.isCarNumberValid = isValid

  render: =>
    <Layout title="차량정보">
      <SelectVehiclePopup isVisible={@state.isSelectVehiclePopupVisible} onChangeVisible={@onChangeVisible} onChange={@onChangeVehicle} />
      <ScrollView style={{ padding: 20 }}>
        <Text size={18} bold>운행중인 차량의 정보를 입력해 주세요.</Text>
        <Input isReuqired placeholder="차량번호를 입력해 주세요." marginTop={20} onChange={@onChangeInput} value={@state.carNumber} />
        { @state.weight? and
          <Input placeholder="차량" isDisabled value={"#{@state.weight.TEXT} #{@state.boxType?.TEXT or ''}"} marginTop={20} />
          }
        <Button marginTop={20} color="blue" onPress={@onPressSelectVehicle}>차량선택</Button>
        <Text size={18} bold marginTop={45}>자동차 등록증이 잘 보이도록 사진으로 찍어 올려주세요.</Text>
        <View style={{ height: 30 }} />
        <ImageFrame url={@state.url} onChange={@onChangeImageFrame} />
        <View style={{ height: 50 }} />
      </ScrollView>
      <Button isDisabled={not @state.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
