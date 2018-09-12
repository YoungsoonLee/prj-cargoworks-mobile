export default observer class UpdateBusinessCertView extends Component
  onPressNext: =>
    @props.onPressNext()

  onPressCheckRegNumber: =>
    @props.onPressCheckRegNumber()

  render: =>
    <Layout title="사업자 등록증">
      <ScrollView>
        <View style={{ flex: 1, padding: 20 }}>
          <Text color="#c12d3a" size={15} bold>영업용 차량의 경우 사업자 정보를 등록하세요. (필수)</Text>
          <Text size={15} marginTop={15}>
            { '''
              사업자(일반과세)로 등록되시면, 현금영수증 자동발행 기능을 사용하실 수 있습니다.

              1. 운송주선사에서 충전금으로 운임을 받고 현금영수증을 자동으로 발행하는 방식이어서 별도의 조작이 필요치 않습니다.

              2. 화주에게 직접 현금 수령시 부가세를 추가하여 받으시고 수동으로 현금영수증을 발행할 수 있습니다.

              3. 현금영수증 발행여부는 별도로 국세청 홈텍스에서 확인 가능합니다.
            ''' }
          </Text>
          <View style={{ height: 10 }} />
          <Error error={@props.validation.isRegNumberChecked.error or @props.validation.isRegNumberValid.error}>
            <View>
              <Input placeholder="사업자 등록번호" state={@props.state} path="value.regNumber" />
              <View style={{ position: 'absolute', right: 0, top: 4 }}>
                <Button textSize={14} height={35} color="light blue invert" onPress={@onPressCheckRegNumber}>사업자 인증</Button>
              </View>
            </View>
          </Error>
          <Input placeholder="상호" state={@props.state} path="value.storeName" />
          <View style={{ height: 15 }} />
          <Input placeholder="대표자명" state={@props.state} path="value.name" />
          <View style={{ height: 15 }} />
          <Input placeholder="주소" state={@props.state} path="value.address" />
          <View style={{ height: 15 }} />
          <Input placeholder="연락처" state={@props.state} path="value.contactNumber" />
          <View style={{ height: 15 }} />
        </View>
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>{ if @props.routeParam?.type is 'update' then '저장' else '다음' }</Button>
    </Layout>
