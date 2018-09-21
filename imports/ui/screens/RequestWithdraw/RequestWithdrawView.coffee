export default observer class RequestWithdrawView extends Component
  render: =>
    <Layout title="충전금 환급 요청">
      <View style={{ paddingHorizontal: 20, paddingVertical: 30 }}>
        <Text bold size={27}>{ @props.bank } <Text bold size={27} color={blue}>{ @props.transporter.withdrawalAccount.accountNumber }</Text></Text>
        <Text bold size={17} marginTop={3} color="#666666">환급받을 계좌</Text>
        <Text marginTop={30} bold size={27}>환급 가능 금액 : <Text bold size={27} color={blue}>{ Util.getFormattedPrice @props.availableWithdraw }</Text> 원</Text>
        <Text bold size={17} marginTop={3} color="#666666">최소 충전 금액 : { Util.getFormattedPrice @props.minDeposite } 원</Text>
      </View>
      <View style={{ borderTopWidth: 1, borderTopColor: '#cccccc' }} />
      <View style={{ paddingHorizontal: 20, paddingVertical: 30 }}>
        <Text center color={darkBlue} bold>환급 받을 금액을 입력해 주세요.</Text>
        <Text center marginTop={3} size={14} color="#666666" bold>카고웍스에서 요청 확인 후 환급받을 계좌로 입금해 드립니다.</Text>
        <Input type="number" marginTop={30} placeholder="금액 입력" />
      </View>
      <View style={{ flex: 1 }} />
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressConfirm}>환급 요청하기</Button>
    </Layout>
