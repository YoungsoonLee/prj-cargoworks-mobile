export default observer class PublishCashReceipt extends Component
  onPressPublish: =>
    # TODO: david. 현금영수증 발행 로직

    Util.back()

    Util.alert '현금 영수증을 발행했습니다.'

  renderMethods: =>
    methods = [
      method: '사업자 번호'
      number: '123-456-7890'
    ,
      method: '핸드폰 번호'
      number: '010-0000-0000'
    ,
      method: '계좌번호'
      number: '1002-000-000000'
    ]

    methods.map (method) =>
      <View style={{ flexDirection: 'row', height: 50, alignItems: 'center' }}>
        <View style={{ width: 50, alignItems: 'center' }}>
          <Checkbox color={black} isChecked={false} onChange={=>} />
        </View>
        <View style={{ width: 100 }}>
          <Text bold color={red}>{ method.method }</Text>
        </View>
        <View style={{ flex: 1 }}>
          <Text bold color={black}>{ method.number }</Text>
        </View>
      </View>

  render: =>
    <Layout title="현금 영수증 발행">
      <ScrollView>
        <View style={{ height: 260, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
          { 1 is 1 and
            <Text bold color={white} size={18}>고객에게 현금 영수증을 발행합니다.</Text>
            }
          { 1 is 2 and
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
                <Text color="#ffffff" size={18}>{ "#{Util.getFormattedPrice 5000000} 원" }</Text>
              </View>
            </View>
            <View style={{ flexDirection: 'row', height: 45, alignItems: 'center', borderBottomWidth: 1, borderBottomColor: '#ffffff' }}>
              <View style={{ width: 60 }}>
                <Text color="#ffffff" size={18}>부가세</Text>
              </View>
              <View style={{ flex: 1, alignItems: 'flex-end' }}>
                <Text color="#ffffff" size={18}>{ "#{Util.getFormattedPrice 5000000} 원" }</Text>
              </View>
            </View>
            <View style={{ flexDirection: 'row', height: 45, alignItems: 'center' }}>
              <View style={{ width: 60 }}>
                <Text color="#fffae1" size={18} bold>합계</Text>
              </View>
              <View style={{ flex: 1, alignItems: 'flex-end' }}>
                <Text color="#fffae1" size={18} bold>{ "#{Util.getFormattedPrice 5000000} 원" }</Text>
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
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressPublish}>고객 현금영수증 발행하기</Button>
    </Layout>
