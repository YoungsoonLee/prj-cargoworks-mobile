import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class Recruitment extends Component
  # @propTypes:
  #   isBorderTopVisible: PropTypes.bool
  #   onPress: PropTypes.func
  #   recruitment: PropTypes.object

  @defaultProps:
    isBorderTopVisible: false
    onPress: =>
    recruitment: {}

  onPress: =>
    @props.onPress()

  render: =>
    transporter = @props.recruitment.transporters.find (transporter) =>
      transporter.transporterId is @props.transporter._id

    if transporter
      if transporter.isConnected
        label = '전담기사 수행중'

      else
        label = '지원함'

    else
      if 1 is 1
        label = '모집중'

      else
        label = '모집종료'

    <Touchable onPress={@onPress}>
      <View style={{ flexDirection: 'row', paddingHorizontal: 20, paddingVertical: 10, borderTopWidth: (if @props.isBorderTopVisible then 1 else 0), borderTopColor: '#a6a6a6', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1 }}>
          <Text size={13} color="#666666">{ "#{moment(@props.recruitment.createdAt).format('YY.MM.DD')} | 월 평균 퀵 #{@props.recruitment.averageParcelOrdersPerMonth}건 / 화물 #{@props.recruitment.averageFreightOrdersPerMonth}건" }</Text>
          <Text bold size={18} marginTop={3}>{ @props.recruitment.consignor.name }</Text>
          <View style={{ height: 10 }} />
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">주요 출발지역</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ @props.recruitment.start }</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">주요 출발지역</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ @props.recruitment.end }</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">모집차량</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ @props.recruitment.vehicleTexts.join ', ' }</Text>
            </View>
          </View>
          <View style={{ flexDirection: 'row' }}>
            <View style={{ width: 100 }}>
              <Text size={15} color="#666666">주요 수행시간</Text>
            </View>
            <View style={{ flex: 1 }}>
              <Text size={15} color="#666666">{ "#{@props.recruitment.startWorkHour}시 ~ #{@props.recruitment.endWorkHour}시" }</Text>
            </View>
          </View>
        </View>
        <View style={{ width: 10, justifyContent: 'center' }}>
          <Ionicons name="ios-arrow-forward" size={23} />
        </View>
        { if label in ['모집중', '전담기사 수행중']
          <View style={{ borderRadius: 2, position: 'absolute', top: 10, right: 10, width: 100, height: 25, backgroundColor: blue, justifyContent: 'center', alignItems: 'center' }}>
            <Text bold color={white} size={13}>{ label }</Text>
          </View>
        }
        { if label in ['모집종료', '지원함']
          <View style={{ borderRadius: 2, position: 'absolute', top: 10, right: 10, width: 100, height: 25, backgroundColor: '#cccccc', justifyContent: 'center', alignItems: 'center' }}>
            <Text bold color={white} size={13}>{ label }</Text>
          </View>
        }
      </View>
    </Touchable>
