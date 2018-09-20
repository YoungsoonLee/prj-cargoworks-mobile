import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class NoticesView extends Component
  onPressNotice: (noticeId) =>
    @props.onPressNotice noticeId

  renderNotices: =>
    @props.notices.map (notice, index) =>
      <Touchable key={notice._id} onPress={=> @onPressNotice notice._id}>
        <View style={{ flexDirection: 'row', paddingVertical: 12, paddingLeft: 28, borderBottomWidth: 1, borderBottomColor: '#a6a6a6', borderTopWidth: (if index is 0 then 1 else 0), borderTopColor: '#a6a6a6' }}>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={14} color="#666666">{ moment(notice.createdAt).format('YYYY.MM.DD') }</Text>
            <Text size={18} marginTop={3} bold>{ notice.title }</Text>
          </View>
          <View style={{ width: 30, alignItems: 'center', justifyContent: 'center' }}>
            <Ionicons name="ios-arrow-forward" size={20} />
          </View>
        </View>
      </Touchable>

  render: =>
    <Layout title="공지사항">
      <ScrollView>
        { @renderNotices() }
      </ScrollView>
    </Layout>
