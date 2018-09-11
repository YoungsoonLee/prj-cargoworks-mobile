import { Picker } from 'react-native'

export default observer class UpdateBankAccountView extends Component
  onChangeSelect: (value, name) =>
    @props.state.value[name] = value

  renderBanks: =>
    _.map @props.ACCOUNTS.BANKS, (BANK) =>
      <Picker.Item key={BANK.VALUE} label={BANK.TEXT} value={BANK.VALUE} />

  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="계좌 정보">
      <ScrollView style={{ flex: 1, padding: 20 }}>
        <Text size={18} bold color="#000000">충전금을 환급 받거나, 현금 주문시 운임을 받을 계좌를 설정하세요.</Text>
        <Select marginTop={15} name="bank" label="은행선택" onChange={@onChangeSelect} value={@props.state.value.bank}>
          { @renderBanks() }
        </Select>
        <Input placeholder="계좌번호" state={@props.state} path="value.accountNumber" />
        <View style={{ height: 15 }} />
        <Input placeholder="예금주" state={@props.state} path="value.holderName" />
        <Text size={18} bold color="#000000" marginTop={40}>주문수수료에 대한 현금영수증 수신 방법을 설정하세요.</Text>
        <Text size={14} marginTop={10} bold>주문수수료에 대한 현금영수증은 비용 증빙자료로 사용 가능합니다. 수신 내역은 국세청 홈텍스에서 확인할 수 있습니다.</Text>
        <Select marginTop={15} name="method" label="영수증 받는 방법" onChange={@onChangeSelect} value={@props.state.value.method}>
          <Picker.Item label="수신안함" value="수신안함" />
          <Picker.Item label="휴대폰번호" value="휴대폰번호" />
          <Picker.Item label="사업자등록번호" value="사업자등록번호" />
        </Select>
        <Input placeholder="방법을 선택 후 번호를 입력해 주세요" state={@props.state} path="value.number" />
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>{ if @props.routeParam.type is 'update' then '저장' else '다음' }</Button>
    </Layout>
