import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class NotificationsView extends Component
  onPressNotification: (notification) =>
    @props.onPressNotification notification

  renderNotifications: =>
    @props.pushNotifications.map (notification, index) =>
      <Touchable key={notification._id} onPress={=> @onPressNotification notification}>
        <View style={{ flexDirection: 'row', paddingVertical: 12, paddingLeft: 28, borderBottomWidth: 1, borderBottomColor: '#a6a6a6', borderTopWidth: (if index is 0 then 1 else 0), borderTopColor: '#a6a6a6' }}>
          <View style={{ flex: 1, justifyContent: 'center' }}>
            <Text size={14} color="#666666">{ moment(notification.createdAt).format('YYYY.MM.DD HH:mm') }</Text>
            <Text size={18} marginTop={3} bold>{ notification.title }</Text>
          </View>
          <View style={{ width: 30, alignItems: 'center', justifyContent: 'center' }}>
            { if 1 is 2
              <Ionicons name="ios-arrow-forward" size={20} />
            }
          </View>
        </View>
      </Touchable>

  render: =>
    <Layout title="푸쉬알림">
      <ScrollView>
        { @renderNotifications() }
      </ScrollView>
    </Layout>
