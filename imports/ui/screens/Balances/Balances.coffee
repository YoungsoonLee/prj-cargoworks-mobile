import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class Balances extends Component
  constructor: (props) ->
    super props

    @state = observable
      filter: '오늘'

  onPressFilter: (filter) =>
    @state.filter = filter

  renderFilters: =>
    filters = [
      '오늘'
      '1주'
      '1개월'
      '3개월'
    ]

    filters.map (filter, index) =>
      <TouchableWithoutFeedback key={index} onPress={=> @onPressFilter filter}>
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', borderLeftWidth: 1, borderLeftColor: '#cccccc', backgroundColor: if filter is @state.filter then '#5b74b4' else white }}>
          <Text bold={filter is @state.filter} size={17} color={if filter is @state.filter then white else '#cccccc'}>{ filter }</Text>
        </View>
      </TouchableWithoutFeedback>

  renderBalances: =>
    balances = [0..5]

    balances.map (balance) =>
      <Touchable>
        <View style={{ height: 70, borderBottomWidth: 1, borderBottomColor: '#a6a6a6', flexDirection: 'row' }}>
          <View style={{ width: 85, justifyContent: 'center', paddingLeft: 7 }}>
            <Text>
              18.09.01{'\n'}
              16:04
            </Text>
          </View>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text color={black} size={22} bold>충전금 입금</Text>
            <Text size={12}>주문번호 1803141530 / 탁송료</Text>
          </View>
          <View style={{ width: 100, justifyContent: 'center' }}>
            <Text color={blue} right>+ { Util.getFormattedPrice 20000 }</Text>
            <Text color="#c12d3a" right>- { Util.getFormattedPrice 20000 }</Text>
          </View>
          <View style={{ width: 30, alignItems: 'center', justifyContent: 'center' }}>
            <Ionicons name="ios-arrow-forward" size={18} />
          </View>
        </View>
      </Touchable>

  render: =>
    <ScrollView style={{ backgroundColor: white }}>
      <View style={{ height: 80, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue }}>
        <Text color={white} bold size={15}>충전금 입금 가상계좌</Text>
        <Text size={15} bold color="#fff79a" marginLeft={10}>하나은행 (532-513225-132)</Text>
        <Text color={white} size={13}>* 입금 즉시 충전금으로 전환됩니다.</Text>
      </View>
      <View style={{ flexDirection: 'row', height: 100, paddingHorizontal: 20 }}>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text bold size={27} color={black}>충전금 <Text bold size={27} color={blue}>467,000원</Text></Text>
          <Text size={17}>환급 대기중 100,000원</Text>
        </View>
        <View style={{ width: 90, alignItems: 'center', justifyContent: 'center' }}>
          <Button color="blue" width={90} height={50} textSize={17} paddingHorizontal={0}>환급요청</Button>
        </View>
      </View>
      <View style={{ flexDirection: 'row', height: 45, borderBottomWidth: 1, borderBottomColor: '#cccccc', borderTopWidth: 1, borderTopColor: '#cccccc' }}>
        { @renderFilters() }
      </View>
      <View style={{ height: 65, flexDirection: 'row', padding: 10, backgroundColor: '#f6f6f6', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1, backgroundColor: white, alignItems: 'center', borderWidth: 1, borderColor: '#cccccc', justifyContent: 'center' }}>
          <Text size={18} color={black}>2018.08.01</Text>
        </View>
        <View style={{ width: 20, alignItems: 'center', justifyContent: 'center' }}>
          <Text size={18} color={black}>~</Text>
        </View>
        <View style={{ flex: 1, backgroundColor: white, alignItems: 'center', borderWidth: 1, borderColor: '#cccccc', justifyContent: 'center' }}>
          <Text size={18} color={black}>2018.08.01</Text>
        </View>
      </View>
      <View style={{ height: 70, paddingHorizontal: 15, flexDirection: 'row', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <View style={{ borderRadius: 100, paddingVertical: 5, paddingHorizontal: 10, backgroundColor: '#3f73b4', alignItems: 'center', justifyContent: 'center' }}>
              <Text color={white}>입금</Text>
            </View>
            <Text color={blue} marginLeft={10} bold>{ "+ #{Util.getFormattedPrice 852000}" }</Text>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', marginTop: 5 }}>
            <View style={{ borderRadius: 100, paddingVertical: 5, paddingHorizontal: 10, backgroundColor: '#c12d3a', alignItems: 'center', justifyContent: 'center' }}>
              <Text color={white}>입금</Text>
            </View>
            <Text color="#c12d3a" marginLeft={10} bold>{ "- #{Util.getFormattedPrice 852000}" }</Text>
          </View>
        </View>
        <View style={{ width: 100, alignItems: 'center', justifyContent: 'center' }}>
          <Text size={14} color="#cccccc">미결제 운임</Text>
          <Switch style={{ marginTop: 20 }} />
        </View>
      </View>
      { @renderBalances() }
    </ScrollView>
