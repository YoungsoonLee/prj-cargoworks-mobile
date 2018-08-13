export default observer class Header extends Component
  constructor: (props) ->
    super props

    @state = observable
      sort: state.header.sort

    reaction(
      =>
        @state.sort
    ,
      =>
        state.header.sort = @state.sort
    )

    reaction(
      =>
        state.header.sort
    ,
      =>
        @state.sort = state.header.sort
    )

  onPressSort: (sort) =>
    @state.sort = sort

  render: =>
    <View style={{ flexDirection: 'row', height: 50, backgroundColor: darkBlue }}>
      <View style={{ width: 50 }}>
        <Touchable>
          <Image source={require '../../../../images/search.png'} style={{ width: 50, height: 50 }} />
        </Touchable>
      </View>
      <View style={{ flex: 1, flexDirection: 'row' }}>
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Touchable onPress={=> @onPressSort 'recent'}>
            <View style={{ width: 80, height: 30, backgroundColor: (if @state.sort is 'recent' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
              <Text size={20} color={if @state.sort is 'recent' then darkBlue else white}>최신순</Text>
            </View>
          </Touchable>
        </View>
        <View style={{ flex: 1.2, justifyContent: 'center', alignItems: 'center' }}>
          <Touchable onPress={=> @onPressSort 'distance'}>
            <View style={{ width: 90, height: 30, backgroundColor: (if @state.sort is 'distance' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
              <Text size={20} color={if @state.sort is 'distance' then darkBlue else white}>근거리순</Text>
            </View>
          </Touchable>
        </View>
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Touchable onPress={=> @onPressSort 'fare'}>
            <View style={{ width: 80, height: 30, backgroundColor: (if @state.sort is 'fare' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
              <Text size={20} color={if @state.sort is 'fare' then darkBlue else white}>운임순</Text>
            </View>
          </Touchable>
        </View>
      </View>
      <View style={{ width: 50 }}>
        <Touchable>
          <Image source={require '../../../../images/setting.png'} style={{ width: 50, height: 50 }} />
        </Touchable>
      </View>
    </View>
