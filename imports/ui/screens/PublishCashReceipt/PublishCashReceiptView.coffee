export default observer class PublishCashReceiptView extends Component
  onPressPublish: (total) =>
    @props.onPressPublish total

  onChangeCheckbox: (isChecked, name) =>
    @props.state.method = name

  renderMethods: =>
    methods = [
      method: '사업자 번호'
      name: 'regNumber'
    ,
      method: '핸드폰 번호'
      name: 'phoneNumber'
    ,
      method: '현금카드번호'
      name: 'cardNumber'
    ]

    methods.map (method, index) =>
      <View key={index} style={{ flexDirection: 'row', height: 60, alignItems: 'center' }}>
        <View style={{ width: 60, alignItems: 'center' }}>
          <CheckboxControlled isSwitch isChecked={@props.state.method is method.method} onChange={@onChangeCheckbox} name={method.method} />
        </View>
        <View style={{ width: 100 }}>
          <Text bold color={red}>{ method.method }</Text>
        </View>
        <View style={{ flex: 1 }}>
          <Input placeholder="번호 입력" state={@props.state} path={method.name} />
        </View>
      </View>

  render: =>
    transporterFare = parseInt @props.order.agentFare.transporter

    additional = transporterFare * 0.1

    total = transporterFare + additional

    <Layout title="현금 영수증 발행">
      <ScrollView paddingBottom={300}>
        <View style={{ height: 260, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
          { if not @props.order.isCashBillPublished
            <Text bold color={white} size={18}>고객에게 현금 영수증을 발행합니다.</Text>
          }
          { if @props.order.isCashBillPublished
            <Text bold color={red} size={18}>이미 현금 영수증을 발행했습니다.</Text>
          }
          <Text center size={14} color="#fffae1" bold marginTop={15}>
            모든 운임은 부가세 별도 입니다.{'\n'}
            부가세 수령 후 현금영수증을 발행하세요.
          </Text>
          <View style={{ width: 240, marginTop: 25 }}>
            <View style={{ flexDirection: 'row', height: 28, alignItems: 'center' }}>
              <View style={{ width: 60 }}>
                <Text color="#ffffff" size={18}>운임</Text>
              </View>
              <View style={{ flex: 1, alignItems: 'flex-end' }}>
                <Text color="#ffffff" size={18}>{ "#{Util.getFormattedPrice transporterFare} 원" }</Text>
              </View>
            </View>
            <View style={{ flexDirection: 'row', height: 45, alignItems: 'center', borderBottomWidth: 1, borderBottomColor: '#ffffff' }}>
              <View style={{ width: 60 }}>
                <Text color="#ffffff" size={18}>부가세</Text>
              </View>
              <View style={{ flex: 1, alignItems: 'flex-end' }}>
                <Text color="#ffffff" size={18}>{ "#{Util.getFormattedPrice additional} 원" }</Text>
              </View>
            </View>
            <View style={{ flexDirection: 'row', height: 45, alignItems: 'center' }}>
              <View style={{ width: 60 }}>
                <Text color="#fffae1" size={18} bold>합계</Text>
              </View>
              <View style={{ flex: 1, alignItems: 'flex-end' }}>
                <Text color="#fffae1" size={18} bold>{ "#{Util.getFormattedPrice total} 원" }</Text>
              </View>
            </View>
          </View>
        </View>
        <View style={{ backgroundColor: '#eeeeee', justifyContent: 'center', paddingLeft: 24, height: 70, borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
          <Text size={18} color={black}>현금영수증 발행 방법 지정</Text>
          <Text size={14}>아래 방법으로 현금영수증을 발행합니다.</Text>
        </View>
        <View style={{ paddingHorizontal: 25, marginTop: 20 }}>
          { @renderMethods() }
        </View>
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid or @props.order.isCashBillPublished} borderRadius={0} height={75} color="light blue" onPress={=> @onPressPublish total}>고객 현금영수증 발행</Button>
    </Layout>
