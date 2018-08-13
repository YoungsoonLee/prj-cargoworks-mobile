export default observer class Order extends Component
  render: =>
    # type = 'parcel'

    # type = 'frieght'

    type = @props.type

    if type is 'parcel'
      return (
        <Touchable key={@props.order._id}>
          <View style={{ flexDirection: 'row', height: 50, backgroundColor: white, borderRadius: 3, marginTop: 1 }}>
            <View style={{ overflow: 'hidden', borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, justifyContent: 'center', paddingLeft: 8 }}>
              <Text bold size={20} color={black}>61</Text>
            </View>
            <View style={{ flexDirection: 'row', borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, alignItems: 'center', paddingLeft: 5 }}>
              <EvilIcons name="clock" color={black} size={27} style={{ marginRight: 2 }} />
              <Text bold size={22} color={black}>{ '팔달 매산로'.slice 0, 5 }</Text>
            </View>
            <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 15 }}>
              <Text bold size={22} color={black}>{ '팔달 매산로'.slice 0, 5 }</Text>
              <View style={{ width: 21, height: 21, backgroundColor: darkBlue, borderRadius: 3, position: 'absolute', top: 13, left: -11, alignItems: 'center', justifyContent: 'center' }}>
                <Text color="#ffffff" size={10} bold>+3</Text>
                {### <Image source={require '../../../../images/round_trip.png'} style={{ width: 12 * 1.3, height: 7 * 1.3 }} /> ###}
              </View>
            </View>
            <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, alignItems: 'center', justifyContent: 'center' }}>
              <Text bold size={20} color={black}>오</Text>
            </View>
            <View style={{ width: 47, alignItems: 'flex-end', justifyContent: 'center', paddingRight: 6 }}>
              <Text bold size={20} color={darkRed}>135</Text>
            </View>
          </View>
        </Touchable>
      )

    else if type is 'frieght'
      return (
        <Touchable key={@props.order._id}>
          <View style={{ flexDirection: 'row', height: 100, backgroundColor: white, borderRadius: 3, marginTop: 1 }}>
            <View style={{ overflow: 'hidden', borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, paddingTop: 8, paddingLeft: 8 }}>
              <Text bold size={20} color={black}>61</Text>
            </View>
            <View style={{ flex: 1 }}>
              <View style={{ height: 66, flexDirection: 'row' }}>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 5 }}>
                  <Text bold size={22} color={black}>{ '팔달 매산로'.slice 0, 5 }</Text>
                  <Text bold size={17} color="#375ab5" marginTop={2}>내일 오전 9:30</Text>
                </View>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 15 }}>
                  <Text bold size={22} color={black}>{ '팔달 매산로'.slice 0, 5 }</Text>
                  <Text bold size={17} color="#375ab5" marginTop={2}>내일 오전 9:30</Text>
                  <View style={{ width: 21, height: 21, backgroundColor: darkBlue, borderRadius: 3, position: 'absolute', top: 10, left: -11, alignItems: 'center', justifyContent: 'center' }}>
                    <Text color="#ffffff" size={10} bold>+9</Text>
                    {### <Image source={require '../../../../images/round_trip.png'} style={{ width: 12 * 1.3, height: 7 * 1.3 }} /> ###}
                  </View>
                </View>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, alignItems: 'center', justifyContent: 'center' }}>
                  <Text bold size={20} color={black}>5</Text>
                  <Text size={17} color={black} marginTop={5}>탑</Text>
                </View>
                <View style={{ width: 47, alignItems: 'flex-end', justifyContent: 'center', paddingRight: 6 }}>
                  <Text bold size={20} color={darkRed}>135</Text>
                  <Text size={17} color={black} marginTop={5}>(1)</Text>
                </View>
              </View>
              <View style={{ height: 34, flexDirection: 'row', borderTopWidth: 1, borderTopColor: '#cccccc' }}>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', flex: 1, justifyContent: 'center', paddingLeft: 5 }}>
                  <Text color="#555555" size={17}>냉장고, 에어컨실외기</Text>
                </View>
                <View style={{ borderRightWidth: 1, borderRightColor: '#cccccc', width: 37, alignItems: 'center', justifyContent: 'center' }}>
                  <Badge badgeColor={red}>급송</Badge>
                </View>
                <View style={{ width: 47, alignItems: 'center', justifyContent: 'center' }}>
                  <Badge badgeColor={red}>급송</Badge>
                </View>
              </View>
            </View>
          </View>
        </Touchable>
      )
