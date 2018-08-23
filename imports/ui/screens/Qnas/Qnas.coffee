import Livechat from 'react-native-livechat'

export default observer class Qnas extends Component
  onPressBack: =>
    Util.back()

  render: =>
    <View style={{ flex: 1, backgroundColor: white }}>
      <View style={{ height: 48 + StatusBar.height, width: width, position: 'absolute', zIndex: 100 }}>
        <StatusBar />
        <View style={{ height: 48, backgroundColor: darkBlue, flexDirection: 'row' }}>
          <View style={{ width: 60, alignItems: 'center', justifyContent: 'center' }}>
            <Touchable onPress={@onPressBack}>
              <View style={{ flexDirection: 'row' }}>
                <SimpleLineIcons name="arrow-left" size={18} color="#a2aabf" />
                <Text color="#a2aabf" marginLeft={3} size={19} bold>뒤로</Text>
              </View>
            </Touchable>
          </View>
          <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
            <Text color={white} size={20} bold>문의하기</Text>
          </View>
          <View style={{ width: 52 }} />
        </View>
      </View>
      <Livechat license={10047538} bubbleLeft={width / 2 - 30} bubbleTop={height / 2} />
    </View>
