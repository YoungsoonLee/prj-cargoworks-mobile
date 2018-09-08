import Ionicons from 'react-native-vector-icons/Ionicons'
import { TextInput } from 'react-native'

export default observer class Header extends Component
  onPressOrdersSort: (sort) =>
    state.header.ordersSort = sort

  onPressMyOrdersSort: (sort) =>
    state.header.myOrdersSort = sort

  onPressSearch: =>
    state.header.isSearchMode = true

  onPressBack: =>
    state.header.search = ''

    state.header.isSearchMode = false

  onPressReset: =>
    state.header.search = ''

  onChangeSearch: (search) =>
    state.header.search = search

  onPressSetting: =>
    Util.go 'Setting'

  render: =>
    <View style={{ flexDirection: 'row', height: 50, backgroundColor: darkBlue }}>
      <View style={{ width: 50, justifyContent: 'center', alignItems: 'center' }}>
        { if not state.header.isSearchMode and not state.header.isSimpleMode
          <Touchable onPress={@onPressSearch}>
            <Image source={require '../../../../images/search.png'} style={{ width: 50, height: 50 }} />
          </Touchable>
        }
        { if state.header.isSearchMode and not state.header.isSimpleMode
          <Touchable onPress={@onPressBack}>
            <Ionicons name="ios-arrow-back" color="#cccccc" size={25} />
          </Touchable>
        }
      </View>
      { if state.header.isSearchMode and not state.header.isSimpleMode
        <View style={{ flex: 1, flexDirection: 'row' }}>
          <View style={{ width: 50, alignItems: 'center', justifyContent: 'center' }}>
            <Image source={require '../../../../images/search.png'} style={{ width: 50, height: 50 }} />
          </View>
          <View style={{ flex: 1, paddingRight: 16, justifyContent: 'center' }}>
            <TextInput value={state.header.search} onChangeText={@onChangeSearch} style={{ height: 35, backgroundColor: white, paddingHorizontal: 10 }} placeholder="검색하기" />
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
      { if not state.header.isSearchMode and not state.header.isSimpleMode and state.tab.screen is 'Orders'
        <View style={{ flex: 1, flexDirection: 'row' }}>
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Touchable onPress={=> @onPressOrdersSort 'recent'}>
              <View style={{ width: 80, height: 30, backgroundColor: (if state.header.ordersSort is 'recent' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
                <Text size={20} color={if state.header.ordersSort is 'recent' then darkBlue else white}>최신순</Text>
              </View>
            </Touchable>
          </View>
          <View style={{ flex: 1.2, justifyContent: 'center', alignItems: 'center' }}>
            <Touchable onPress={=> @onPressOrdersSort 'distance'}>
              <View style={{ width: 90, height: 30, backgroundColor: (if state.header.ordersSort is 'distance' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
                <Text size={20} color={if state.header.ordersSort is 'distance' then darkBlue else white}>근거리순</Text>
              </View>
            </Touchable>
          </View>
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Touchable onPress={=> @onPressOrdersSort 'fare'}>
              <View style={{ width: 80, height: 30, backgroundColor: (if state.header.ordersSort is 'fare' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
                <Text size={20} color={if state.header.ordersSort is 'fare' then darkBlue else white}>운임순</Text>
              </View>
            </Touchable>
          </View>
        </View>
      }
      { if not state.header.isSearchMode and not state.header.isSimpleMode and state.tab.screen is 'MyOrders'
        <View style={{ flex: 1, flexDirection: 'row' }}>
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Touchable onPress={=> @onPressMyOrdersSort 'in progress'}>
              <View style={{ width: 80, height: 30, backgroundColor: (if state.header.myOrdersSort is 'in progress' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
                <Text size={20} color={if state.header.myOrdersSort is 'in progress' then darkBlue else white}>운행중</Text>
              </View>
            </Touchable>
          </View>
          <View style={{ flex: 1.2, justifyContent: 'center', alignItems: 'center' }}>
            <Touchable onPress={=> @onPressMyOrdersSort 'today'}>
              <View style={{ width: 90, height: 30, backgroundColor: (if state.header.myOrdersSort is 'today' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
                <Text size={20} color={if state.header.myOrdersSort is 'today' then darkBlue else white}>오늘주문</Text>
              </View>
            </Touchable>
          </View>
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
            <Touchable onPress={=> @onPressMyOrdersSort 'last'}>
              <View style={{ width: 80, height: 30, backgroundColor: (if state.header.myOrdersSort is 'last' then white else darkBlue), borderRadius: 15, alignItems: 'center', justifyContent: 'center' }}>
                <Text size={20} color={if state.header.myOrdersSort is 'last' then darkBlue else white}>지난주문</Text>
              </View>
            </Touchable>
          </View>
        </View>
      }
      { if state.header.isSimpleMode
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text color={white} size={20} bold>{ state.header.title }</Text>
        </View>
      }
      { if not state.header.isSearchMode
        <View style={{ width: 50 }}>
          <Touchable onPress={@onPressSetting}>
            <Image source={require '../../../../images/setting.png'} style={{ width: 50, height: 50 }} />
          </Touchable>
        </View>
      }
    </View>
