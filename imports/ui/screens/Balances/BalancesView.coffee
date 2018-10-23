import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class BalancesView extends Component
  onPressFilter: (filter) =>
    @props.onPressFilter filter

  renderFilters: =>
    filters = [
      '오늘'
      '1주'
      '1개월'
      '3개월'
    ]

    filters.map (filter, index) =>
      <TouchableWithoutFeedback key={index} onPress={=> @onPressFilter filter}>
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', borderLeftWidth: 1, borderLeftColor: '#cccccc', backgroundColor: if filter is @props.state.filter then '#5b74b4' else white }}>
          <Text bold={filter is @props.state.filter} size={17} color={if filter is @props.state.filter then white else '#cccccc'}>{ filter }</Text>
        </View>
      </TouchableWithoutFeedback>

  onPressBalance: (balance) =>
    @props.onPressBalance balance

  renderBalances: =>
    @props.balances.map (balance, index) =>
      if /FEE|WITHDRAWAL/.test balance.transactionType
        isWithdrawal = true

      else
        isWithdrawal = false

      <Touchable key={index} onPress={=> @onPressBalance balance}>
        <View style={{ height: 70, borderBottomWidth: 1, borderBottomColor: '#a6a6a6', flexDirection: 'row' }}>
          <View style={{ width: 85, justifyContent: 'center', paddingLeft: 7 }}>
            <Text>
              { moment(balance.createdAt).format('YY.MM.DD') }{'\n'}
              { moment(balance.createdAt).format('HH:mm') }
            </Text>
          </View>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text color={black} size={22} bold>{ @props.BALANCES.TRANSACTIONS.TYPES[balance.transactionType].TEXT.replace /기사 /g, '' }</Text>
            { if not not balance.orderId or not not balance.reason
              <Text size={12}>{ not not balance.orderId and '주문번호 ' }{ balance.orderId }{ not not balance.reason and ' / ' }{ balance.reason }</Text>
            }
          </View>
          <View style={{ width: 100, justifyContent: 'center' }}>
            { if isWithdrawal
              <Text color="#c12d3a" right>- { Util.getFormattedPrice balance.amount }</Text>
            }
            { if not isWithdrawal
              <Text color={blue} right>+ { Util.getFormattedPrice balance.amount }</Text>
            }
          </View>
          <View style={{ width: 30, alignItems: 'center', justifyContent: 'center' }}>
            <Ionicons name="ios-arrow-forward" size={18} />
          </View>
        </View>
      </Touchable>

  onPressRequestWithdraw: =>
    @props.onPressRequestWithdraw()

  render: =>
    <ScrollView style={{ backgroundColor: white }}>
      <View style={{ height: 80, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue }}>
        <Text color={white} bold size={15}>충전금 입금 가상계좌</Text>
        <Text size={15} bold color="#fff79a" marginLeft={10}>기업은행 ({ @props.transporter.virtualAccount })</Text>
        <Text color={white} size={13}>* 입금 즉시 충전금으로 전환됩니다.</Text>
      </View>
      <View style={{ flexDirection: 'row', height: 100, paddingHorizontal: 20 }}>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text bold size={27} color={black}>충전금 <Text bold size={27} color={blue}>{ Util.getFormattedPrice @props.transporter.deposit }원</Text></Text>
          <Text size={17}>환급 대기중 { Util.getFormattedPrice @props.requestedWithdraw }원</Text>
        </View>
        <View style={{ width: 90, alignItems: 'center', justifyContent: 'center' }}>
          <Button color="blue" width={90} height={50} textSize={17} paddingHorizontal={0} onPress={@onPressRequestWithdraw}>환급요청</Button>
        </View>
      </View>
      <View style={{ flexDirection: 'row', height: 45, borderBottomWidth: 1, borderBottomColor: '#cccccc', borderTopWidth: 1, borderTopColor: '#cccccc' }}>
        { @renderFilters() }
      </View>
      <View style={{ height: 65, flexDirection: 'row', padding: 10, backgroundColor: '#f6f6f6', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1, backgroundColor: white, alignItems: 'center', borderWidth: 1, borderColor: '#cccccc', justifyContent: 'center' }}>
          <Text size={18} color={black}>{ @props.state.startAt.format('YYYY.MM.DD') }</Text>
        </View>
        <View style={{ width: 20, alignItems: 'center', justifyContent: 'center' }}>
          <Text size={18} color={black}>~</Text>
        </View>
        <View style={{ flex: 1, backgroundColor: white, alignItems: 'center', borderWidth: 1, borderColor: '#cccccc', justifyContent: 'center' }}>
          <Text size={18} color={black}>{ @props.state.endAt.format('YYYY.MM.DD') }</Text>
        </View>
      </View>
      <View style={{ height: 70, paddingHorizontal: 15, flexDirection: 'row', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <View style={{ borderRadius: 100, paddingVertical: 5, paddingHorizontal: 10, backgroundColor: '#3f73b4', alignItems: 'center', justifyContent: 'center' }}>
              <Text color={white}>입금</Text>
            </View>
            <Text color={blue} marginLeft={10} bold>{ "+ #{Util.getFormattedPrice @props.deposite}" }</Text>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', marginTop: 5 }}>
            <View style={{ borderRadius: 100, paddingVertical: 5, paddingHorizontal: 10, backgroundColor: '#c12d3a', alignItems: 'center', justifyContent: 'center' }}>
              <Text color={white}>출금</Text>
            </View>
            <Text color="#c12d3a" marginLeft={10} bold>{ "- #{Util.getFormattedPrice @props.withdrawal}" }</Text>
          </View>
        </View>
        <View style={{ width: 100, alignItems: 'center', justifyContent: 'center' }}>
          <Text size={14} color="#cccccc">미결제 운임</Text>
          <Switch style={{ marginTop: 20 }} state={@props.state} path="isOutstandingIncluded" />
        </View>
      </View>
      { @renderBalances() }
    </ScrollView>
