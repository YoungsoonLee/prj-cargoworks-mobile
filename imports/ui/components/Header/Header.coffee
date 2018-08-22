import Ionicons from 'react-native-vector-icons/Ionicons'
import { TextInput } from 'react-native'

export default observer class Header extends Component
  constructor: (props) ->
    super props

    @state = observable
      isSimpleMode: state.header.isSimpleMode
      title: state.header.title
      isSearchMode: false
      sort: state.header.sort
      search: state.header.search

    reaction(
      =>
        @state.isSimpleMode + @state.title + @state.isSearchMode + @state.sort + @state.search
    ,
      =>
        state.header.isSimpleMode = @state.isSimpleMode
        state.header.title = @state.title
        state.header.isSearchMode = @state.isSearchMode
        state.header.sort = @state.sort
        state.header.search = @state.search
    )

    reaction(
      =>
        state.header.isSimpleMode + state.header.title + state.header.isSearchMode + state.header.sort + state.header.search
    ,
      =>
        @state.isSimpleMode = state.header.isSimpleMode
        @state.title = state.header.title
        @state.isSearchMode = state.header.isSearchMode
        @state.sort = state.header.sort
        @state.search = state.header.search
    )

  onPressSort: (sort) =>
    @state.sort = sort

  onPressSearch: =>
    @state.isSearchMode = true

  onPressBack: =>
    @state.search = ''

    @state.isSearchMode = false

  onPressReset: =>
    @state.search = ''

  onChangeSearch: (search) =>
    @state.search = search

  onPressSetting: =>
    Util.go 'Setting'

  render: =>
    <View style={{ flexDirection: 'row', height: 50, backgroundColor: darkBlue }}>
      <View style={{ width: 50, justifyContent: 'center', alignItems: 'center' }}>
        { not @state.isSearchMode and not @state.isSimpleMode and
          <Touchable onPress={@onPressSearch}>
            <Image source={require '../../../../images/search.png'} style={{ width: 50, height: 50 }} />
          </Touchable>
          }
        { @state.isSearchMode and not @state.isSimpleMode and
          <Touchable onPress={@onPressBack}>
            <Ionicons name="ios-arrow-back" color="#cccccc" size={25} />
          </Touchable>
          }
      </View>
      { @state.isSearchMode and not @state.isSimpleMode and
        <View style={{ flex: 1, flexDirection: 'row' }}>
          <View style={{ width: 50, alignItems: 'center', justifyContent: 'center' }}>
            <Image source={require '../../../../images/search.png'} style={{ width: 50, height: 50 }} />
          </View>
          <View style={{ flex: 1, paddingRight: 16, justifyContent: 'center' }}>
            <TextInput value={@state.search} onChangeText={@onChangeSearch} style={{ height: 35, backgroundColor: white, paddingHorizontal: 10 }} placeholder="검색하기" />
            <View style={{ position: 'absolute', top: 0, right: 8 }}>
              <Touchable onPress={@onPressReset}>
                <View style={{ width: 50, height: 50, alignItems: 'center', justifyContent: 'center' }}>
                  <Image source={require '../../../../images/close.png'} style={{ width: 20, height: 20 }} />
                </View>
              </Touchable>
            </View>
          </View>
        </View>
        }
      { not @state.isSearchMode and not @state.isSimpleMode and
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
        }
      { @state.isSimpleMode and
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text color={white} size={20} bold>{ @state.title }</Text>
        </View>
        }
      { not @state.isSearchMode and
        <View style={{ width: 50 }}>
          <Touchable onPress={@onPressSetting}>
            <Image source={require '../../../../images/setting.png'} style={{ width: 50, height: 50 }} />
          </Touchable>
        </View>
        }
    </View>
