import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class FaqsView extends Component
  onPressFaq: (faqId) =>
    @props.onPressFaq faqId

  renderFaqs: =>
    @props.faqs.map (faqs, index) =>
      <Touchable key={faqs._id} onPress={=> @onPressFaq faqs._id}>
        <View style={{ flexDirection: 'row', paddingVertical: 12, paddingLeft: 28, borderBottomWidth: 1, borderBottomColor: '#a6a6a6', borderTopWidth: (if index is 0 then 1 else 0), borderTopColor: '#a6a6a6' }}>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={14} color="#666666">{ moment(faqs.createdAt).format('YYYY.MM.DD') }</Text>
            <Text size={18} marginTop={3} bold>{ faqs.title }</Text>
          </View>
          <View style={{ width: 30, alignItems: 'center', justifyContent: 'center' }}>
            <Ionicons name="ios-arrow-forward" size={20} />
          </View>
        </View>
      </Touchable>

  render: =>
    <Layout title="자주 묻는 질문">
      <ScrollView>
        { @renderFaqs() }
      </ScrollView>
    </Layout>
