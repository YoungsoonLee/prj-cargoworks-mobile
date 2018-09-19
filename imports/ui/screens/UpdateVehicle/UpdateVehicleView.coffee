import SelectVehiclePopup from '../../components/SelectVehiclePopup/SelectVehiclePopup.coffee'

export default observer class UpdateVehicleView extends Component
  onPressSelectVehicle: =>
    @props.state.isSelectVehiclePopupVisible = true

  onPressNext: =>
    @props.onPressNext()

  onChangeImageFrame: (url) =>
    @props.state.carRegisterImageUrl = url

  render: =>
    <Layout title="차량정보">
      <SelectVehiclePopup state={@props.state} isVisiblePath="isSelectVehiclePopupVisible" weightPath="weight" boxTypePath="boxType" vehiclePath="vehicle" />
      <ScrollView style={{ padding: 20 }}>
        <Text size={18} bold>운행중인 차량의 정보를 입력해 주세요.</Text>
        <Input placeholder="차량번호를 입력해 주세요." marginTop={20} state={@props.state} path="carNumber" />
        { not not @props.state.vehicle and
          <Input placeholder="차량" isDisabled state={@props.state} path="vehicle" marginTop={20} />
          }
        <Button marginTop={20} color="blue" onPress={@onPressSelectVehicle}>차량선택</Button>
        <Text size={18} bold marginTop={45}>자동차등록증을 촬영하여 올려주세요.</Text>
        <Text size={17} bold color="#555555">(주민등록번호 뒤 7자리를 펜으로 가려서 촬영하세요)</Text>
        <View style={{ height: 30 }} />
        <ImageUploader state={@props.state} path="carRegisterImageUrl" />
        <View style={{ height: 50 }} />
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>{ if @props.routeParam?.type is 'update' then '저장하기' else '다음' }</Button>
    </Layout>
