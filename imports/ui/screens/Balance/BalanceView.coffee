import CwHeader from '../../components/CwHeader/CwHeader.coffee'
import MyOrderDetail from '../../components/MyOrderDetail/MyOrderDetail.coffee'

export default observer class Balance extends Component
  renderDetails: =>
    @props.details.map (detail, index) =>
      <View key={index} style={{ marginTop: (if index is 0 then 0 else 15) }}>
        <Text bold size={18} color={darkBlue}>{ detail.title }</Text>
        <Text bold marginTop={7}>{ detail.content }</Text>
      </View>

  onPressOrderDetail: =>
    @props.onPressOrderDetail()

  render: =>
    if /FEE|WITHDRAWAL/.test @props.balance.transactionType
      isWithdrawal = true

    else
      isWithdrawal = false

    <Layout title="충전금 상세">
      <View style={{ height: 70, flexDirection: 'row' }}>
        <View style={{ width: 85, justifyContent: 'center', paddingLeft: 7 }}>
          <Text>
            { moment(@props.balance.createdAt).format('YY.MM.DD') }{'\n'}
            { moment(@props.balance.createdAt).format('HH:mm') }
          </Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text color={black} size={22} bold>{ @props.BALANCES.TRANSACTIONS.TYPES[@props.balance.transactionType].TEXT }</Text>
          { if not not @props.balance.orderId or not not @props.balance.reason
            <Text size={12}>{ not not @props.balance.orderId and '주문번호 ' }{ @props.balance.orderId }{ not not @props.balance.reason and ' / ' }{ @props.balance.reason }</Text>
          }
        </View>
        <View style={{ width: 100, justifyContent: 'center' }}>
          { if isWithdrawal
            <Text color="#c12d3a" right>- { Util.getFormattedPrice @props.balance.amount }</Text>
          }
          { if not isWithdrawal
            <Text color={blue} right>+ { Util.getFormattedPrice @props.balance.amount }</Text>
          }
        </View>
        <View style={{ width: 30 }} />
      </View>
      <CwHeader>상세내용</CwHeader>
      { if @props.type in ['deposite', 'transporter withdrawal']
        <ScrollView style={{ padding: 20 }}>
          { @renderDetails() }
        </ScrollView>
      }
      { if @props.type is 'normal'
        <ScrollView>
          <MyOrderDetail order={@props.order} />
        </ScrollView>
      }
    </Layout>
