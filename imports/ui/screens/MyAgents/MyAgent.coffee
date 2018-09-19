import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class MyAgent extends Component
  # @propTypes:
  #   isBorderTopVisible: PropTypes.bool
  #   onPress: PropTypes.func

  @defaultProps:
    isBorderTopVisible: false
    onPress: =>

  onPress: =>
    @props.onPress()

  render: =>
    <Touchable onPress={@onPress}>
      <View style={{ flexDirection: 'row', paddingHorizontal: 20, paddingVertical: 10, borderTopWidth: (if @props.isBorderTopVisible then 1 else 0), borderTopColor: '#a6a6a6', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1 }}>
          <Text size={13} color="#666666">{ "#{moment().format('YY.MM.DD')} | 월 평균 퀵 50건 / 화물 50건" }</Text>
          <Text bold size={18} marginTop={3}>{ "(주)스마트링크커뮤니케이션즈" }</Text>
          <View style={{ height: 10 }} />
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">주요 출발지역</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ "서울시 강남구 신사동 520-5" }</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">주요 출발지역</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ "서울시 강남구 신사동 520-5" }</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">모집차량</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ "다마스, 벤" }</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">주요 수행시간</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ "오전시간대" }</Text>
            </View>
          </View>
        </View>
        <View style={{ width: 10, justifyContent: 'center' }}>
          <Ionicons name="ios-arrow-forward" size={23} />
        </View>
        <View style={{ borderRadius: 2, position: 'absolute', top: 10, right: 10, width: 100, height: 25, backgroundColor: blue, justifyContent: 'center', alignItems: 'center' }}>
          <Text bold color={white} size={13}>전담기사 수행중</Text>
        </View>
      </View>
    </Touchable>
