import Ionicons from 'react-native-vector-icons/Ionicons'
import { TextInput } from 'react-native'

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

  onChangeSearch: (value) =>
    @props.state.search = value

  onPressReset: =>
    @props.state.search = ''

  render: =>
    <Layout title="자주 묻는 질문">
      <View style={{ padding: 10 }}>
        <View style={{ height: 40, flexDirection: 'row', borderRadius: 3, borderWidth: 1, borderColor: '#a6a6a6' }}>
          <View style={{ width: 40, alignItems: 'center', justifyContent: 'center' }}>
            <Image source={require '../../../../images/search.png'} style={{ width: 50, height: 50 }} />
          </View>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <TextInput value={@props.state.search} onChangeText={@onChangeSearch} style={{ height: 35, backgroundColor: white }} placeholder="질문 검색하기" />
            <View style={{ position: 'absolute', top: 0, right: 0 }}>
              <Touchable onPress={@onPressReset}>
                <View style={{ width: 40, height: 40, alignItems: 'center', justifyContent: 'center' }}>
                  <Image source={require '../../../../images/close.png'} style={{ width: 20, height: 20 }} />
                </View>
              </Touchable>
            </View>
          </View>
        </View>
      </View>
      <ScrollView>
        { @renderFaqs() }
      </ScrollView>
    </Layout>
