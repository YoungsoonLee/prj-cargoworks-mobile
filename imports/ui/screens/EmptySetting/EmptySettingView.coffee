import CwHeader from '../../components/CwHeader/CwHeader.coffee'

export default observer class EmptySettingView extends Component
  onPressSelectDate: =>
    @props.modal.show()

  render: =>
    <Layout title="공차,혼적 등록">
      <ScrollView>
        <CwHeader>공차 등록하기</CwHeader>
        <View style={{ paddingHorizontal: 20 }}>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 65 }}>
            <View style={{ width: 50 }}>
              <Text>공차</Text>
            </View>
            <View style={{ flex: 1, flexDirection: 'row' }}>
              <Switch state={@props.state} path="isEmpty" />
              <View style={{ marginLeft: 7 }}>
                <Text color={black} size={14}>원하는 목적지를 선택하세요.</Text>
                <Text color={black} size={11}>* 등록 후 1건이라도 주문을 수락하면 자동 해제됩니다.</Text>
              </View>
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 65 }}>
            <View style={{ width: 100 }}>
              <Text>목적지</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Input placeholder="목적지를 입력하세요." state={@props.state} path="address" />
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 65 }}>
            <View style={{ width: 100 }}>
              <Text>출발일자</Text>
            </View>
            <View style={{ flex: 1 }}>
              { if not @props.state.startDate
                <Button onPress={@onPressSelectDate}>날짜선택</Button>

              else
                <Text>{ moment(@props.state.startDate).format('YYYY-MM-DD') }</Text>
              }
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 65 }}>
            <View style={{ width: 100 }}>
              <Text>출발시간</Text>
            </View>
            <View style={{ flex: 1 }}>

            </View>
          </View>
        </View>
        <CwHeader>혼적 등록하기</CwHeader>
        <View style={{ paddingHorizontal: 20 }}>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 65 }}>
            <View style={{ width: 50 }}>
              <Text>혼적</Text>
            </View>
            <View style={{ flex: 1, flexDirection: 'row' }}>
              <Switch />
              <View style={{ marginLeft: 7 }}>
                <Text color={black} size={14}>혼적 가능한 적재공간을 선택하세요.</Text>
                <Text color={black} size={11}>* 등록 후 1건이라도 주문을 수락하면 자동 해제됩니다.</Text>
              </View>
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 40 }}>
            <View style={{ width: 40, alignItems: 'center' }}>
              <Checkbox color={black} />
            </View>
            <View style={{ flex: 1 }}>
              <Text color={black} size={14}>전체</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 40 }}>
            <View style={{ width: 40, alignItems: 'center' }}>
              <Checkbox color={black} />
            </View>
            <View style={{ flex: 1 }}>
              <Text color={black} size={14}>1/2</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', height: 40 }}>
            <View style={{ width: 40, alignItems: 'center' }}>
              <Checkbox color={black} />
            </View>
            <View style={{ flex: 1 }}>
              <Text color={black} size={14}>1/3</Text>
            </View>
          </View>
        </View>
        <View style={{ height: 30 }} />
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>저장하기</Button>
    </Layout>
