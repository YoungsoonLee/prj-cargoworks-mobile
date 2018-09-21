import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class FaqsView extends Component
  onPressFaq: (faqId) =>
    @props.onPressFaq faqId

  renderFaqs: =>
    @props.faqs.map (faq, index) =>
      <Touchable key={faq._id} onPress={=> @onPressFaq faq._id}>
        <View style={{ flexDirection: 'row', paddingVertical: 25, paddingLeft: 28, borderBottomWidth: 1, borderBottomColor: '#a6a6a6', borderTopWidth: (if index is 0 then 1 else 0), borderTopColor: '#a6a6a6' }}>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={18} bold>{ faq.title }</Text>
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
