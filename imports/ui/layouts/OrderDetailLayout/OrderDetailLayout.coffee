export default observer class OrderDetailLayout extends Component
  # @propTypes:
  #   order: PropTypes.object
  #   type: PropTypes.oneOf ['order', 'my order']

  @defaultProps:
    order: {}
    type: 'order'

  render: =>
    <View style={{ flex: 1 }}>
      <View style={{ height: 50, backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: lightBlue, justifyContent: 'center', alignItems: 'center', flexDirection: 'row' }}>
        <Text bold size={20} color={yellow}>225.000원</Text>
        <Badge marginLeft={8} badgeColor={yellow} textColor={black}>수</Badge>
        <Text marginLeft={8} bold size={18} color={yellow}>25,000</Text>
        <Text marginLeft={8} bold size={20} color="#76eaa0">혼적</Text>
        <Text marginLeft={8} bold size={20} color="#8987ce">|</Text>
        <Text marginLeft={8} bold size={20} color="#71d5ff">혼적</Text>
      </View>
      <View style={{ height: 40, backgroundColor: lightYellow, justifyContent: 'center', alignItems: 'center' }}>
        <Text color={black}>전담거래처 주문입니다.</Text>
      </View>
      <View style={{ flex: 1 }}>
        { @props.children }
      </View>
      <View style={{ flexDirection: 'row', height: 60, backgroundColor: darkBlue }}>
        <View style={{ flex: 1, flexDirection: 'row', alignItems: 'center', paddingLeft: 5 }}>
          <Text bold size={15} color={white}>거리</Text>
          <Text marginLeft={8} bold size={15} color={yellow}>432.8 km</Text>
          <Text marginLeft={8} bold size={15} color="#8987ce">|</Text>
          <Text marginLeft={8} bold size={15} color={white}>예상운행시간</Text>
          <Text marginLeft={8} bold size={15} color={yellow}>136분</Text>
        </View>
        <View style={{ width: 120, justifyContent: 'center', alignItems: 'center', flexDirection: 'row' }}>
          <Button paddingHorizontal={0} buttonColor={white} width={if @props.type is 'order' then 85 else 50} height={35}>
            <View style={{ flexDirection: 'row' }}>
              <Text size={15} color={black}>{ if @props.type is 'order' then '지도보기' else '지도' }</Text>
              <Image source={require '../../../../images/marker.png'} style={{ marginLeft: 3, width: 10, height: 14 }} />
            </View>
          </Button>
          { @props.type is 'my order' and
            <Button paddingHorizontal={0} buttonColor={white} width={50} height={35} marginLeft={5}>
              <View style={{ flexDirection: 'row' }}>
                <Text size={15} color={black}>티맵</Text>
                <Image source={require '../../../../images/tmap.png'} style={{ marginLeft: 1, width: 13, height: 14 }} />
              </View>
            </Button>
            }
        </View>
      </View>
    </View>
