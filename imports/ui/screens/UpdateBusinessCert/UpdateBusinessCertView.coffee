export default observer class UpdateBusinessCertView extends Component
  onPressNext: =>
    @props.onPressNext()

  onPressCheckRegNumber: =>
    @props.state.isRegNumberChecked = true

    Meteor.call 'checkRegNumber', @props.state.regNumber, (error, result) =>
      if error or result.type isnt '1'
        if not isProduction
          @props.state.isRegNumberValid = true

          Util.alert '유효하지 않은 사업자 등록번호이지만 개발 모드라서 봐준다'

        if isProduction
          @props.state.isRegNumberValid = false

          Util.alert '유효하지 않은 사업자 등록번호입니다'

        return

      @props.state.isRegNumberValid = true

      Util.alert '유효한 사업자 등록번호입니다'

  render: =>
    <Layout title="사업자 등록증">
      <ScrollView>
        <View style={{ flex: 1, padding: 20 }}>
          <Text color="#c12d3a" size={14}>영업용 차량의 경우 사업자 정보를 등록하세요 (필수)</Text>
          <Text size={14} marginTop={15}>
            사업자(일반과세)로 등록되시면,{'\n'}
            현금영수증 자동발행 기능을 사용하실 수 있습니다{'\n'}
            {'\n'}
            1. 운송사에서 충전금으로 운임을 받고{'\n'}
               현금영수증을 자동으로 발행하는 방식이어서{'\n'}
               별도의 조작이 필요치 않습니다.{'\n'}
            {'\n'}
            2. 화주에게 직접 현금 수령시 부가세를 추가하여 받으시고{'\n'}
               수동으로 현금영수증을 발행할 수 있습니다.{'\n'}
            {'\n'}
            3. 현금영수증 발행여부는{'\n'}
               별도로 국세청 홈텍스에서 확인 가능합니다.{'\n'}
          </Text>
          <View style={{ marginTop: 10 }}>
            <Input placeholder="사업자 등록번호" state={@props.state} path="value.regNumber" />
            <View style={{ position: 'absolute', right: 0, top: 4 }}>
              <Button textSize={14} height={35} color="light blue invert" onPress={@onPressCheckRegNumber}>사업자 인증</Button>
            </View>
          </View>
          <Input placeholder="상호" state={@props.state} path="value.storeName" />
          <Input placeholder="대표자명" state={@props.state} path="value.name" />
          <Input placeholder="주소" state={@props.state} path="value.address" />
          <Input placeholder="연락처" state={@props.state} path="value.contactNumber" />
        </View>
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
