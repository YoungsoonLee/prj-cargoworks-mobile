import compareVersions from 'compare-versions'

export default observer class AppInfoView extends Component
  onPressUpdate: =>
    @props.onPressUpdate()

  render: =>
    compare = compareVersions Meteor.settings.version, @props.global.latestVersion

    <Layout title="어플리케이션 정보">
      <View style={{ flexDirection: 'row', height: 60 }}>
        <View style={{ width: 120, justifyContent: 'center', alignItems: 'center' }}>
          <Text bold>현재 버전</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text>{ Meteor.settings.version }</Text>
        </View>
      </View>
      <View style={{ flexDirection: 'row', height: 60 }}>
        <View style={{ width: 120, justifyContent: 'center', alignItems: 'center' }}>
          <Text bold>최신 버전</Text>
        </View>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text>{ @props.global.latestVersion }</Text>
        </View>
      </View>
      <View style={{ padding: 16, marginTop: 30 }}>
        <Button onPress={@onPressUpdate} isDisabled={compare >= 0} color="light blue">{ if compare >= 0 then '이미 최신버전입니다' else '최신버전 업데이트' }</Button>
      </View>
    </Layout>
