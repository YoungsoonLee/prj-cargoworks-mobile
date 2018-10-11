import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class OrdersByAddressView extends Component
  onPressAddressOrder: (addressOrder) =>
    @props.onPressAddressOrder addressOrder

  renderAddressOrders: =>
    @props.addressOrders.map (addressOrder, index) =>
      <Touchable key={index} onPress={=> @onPressAddressOrder addressOrder}>
        <View style={{ flexDirection: 'row', height: 55, borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={18} bold marginLeft={25}>{ addressOrder.address }</Text>
          </View>
          <View style={{ width: 120, alignItems: 'flex-end', justifyContent: 'center' }}>
            <Text size={18} bold>{ Util.getFormattedPrice addressOrder.count }</Text>
          </View>
          <View style={{ width: 55, alignItems: 'center', justifyContent: 'center' }}>
            <Ionicons name="ios-arrow-forward" size={20} />
          </View>
        </View>
      </Touchable>

  render: =>
    <Layout title="지역현황">
      <View style={{ height: 100, alignItems: 'center', justifyContent: 'center', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <Text bold color="#666666" size={18}>현재 지역별 주문수신 차량의 주문 현황입니다.</Text>
        <Text bold color="#666666" size={14}>주문수신 설정값에 해당하는 현황입니다.</Text>
      </View>
      <ScrollView>
        { @renderAddressOrders() }
      </ScrollView>
    </Layout>
