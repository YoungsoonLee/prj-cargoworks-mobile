import { isIphoneX } from 'react-native-iphone-x-helper'

export default observer class TabMenu extends Component
  constructor: (props) ->
    super props

    @state = observable
      isPressed: false

  onPressTab: (screen, index) =>
    if @state.isPressed
      return

    @state.isPressed = true

    setTimeout =>
      @state.isPressed = false
    , 500

    state.lazyLoadFlags[index] = true

    state.tab.screen = screen

    if screen is 'OrderSetting'
      state.header.title = '주문설정'
      state.header.isSimpleMode = true
      state.header.isSearchMode = false
      state.header.search = ''

    else if screen is 'Balances'
      state.header.title = '입출관리'
      state.header.isSimpleMode = true
      state.header.isSearchMode = false
      state.header.search = ''

    else
      state.header.isSimpleMode = false

    Util.og screen

  render: =>
    <View>
      <View style={{ flexDirection: 'row', backgroundColor: darkBlue, height: 70, borderTopWidth: 3, borderTopColor: '#3a4a74' }}>
        <View style={{ flex: 1 }}>
          { if @props.navigation.state.index is 0
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
              <Image source={require '../../../../images/tab_menu_item_0_active.png'} style={{ width: 30, height: 30 }} />
              <Text bold marginTop={3} color={white}>주문수신</Text>
            </View>
          }
          { if @props.navigation.state.index isnt 0
            <TouchableWithoutFeedback onPress={=> @onPressTab 'Orders', 0}>
              <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <Image source={require '../../../../images/tab_menu_item_0.png'} style={{ width: 30, height: 30 }} />
                <Text bold marginTop={3} color="#a2aabf">주문수신</Text>
              </View>
            </TouchableWithoutFeedback>
          }
          { if 1 is 2
            <View style={{ position: 'absolute', top: 10, right: 23, borderRadius: 4, width: 7, height: 7, backgroundColor: red }} />
          }
        </View>
        <View style={{ flex: 1 }}>
          { if @props.navigation.state.index is 1
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
              <Image source={require '../../../../images/tab_menu_item_1_active.png'} style={{ width: 30, height: 30 }} />
              <Text bold marginTop={3} color={white}>내주문</Text>
            </View>
          }
          { if @props.navigation.state.index isnt 1
            <TouchableWithoutFeedback onPress={=> @onPressTab 'MyOrders', 1}>
              <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <Image source={require '../../../../images/tab_menu_item_1.png'} style={{ width: 30, height: 30 }} />
                <Text bold marginTop={3} color="#a2aabf">내주문</Text>
              </View>
            </TouchableWithoutFeedback>
          }
          { if 1 is 2
            <View style={{ position: 'absolute', top: 10, right: 23, borderRadius: 4, width: 7, height: 7, backgroundColor: red }} />
          }
        </View>
        <View style={{ flex: 1 }}>
          { if @props.navigation.state.index is 2
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
              <Image source={require '../../../../images/tab_menu_item_2_active.png'} style={{ width: 30, height: 30 }} />
              <Text bold marginTop={3} color={white}>주문설정</Text>
            </View>
          }
          { if @props.navigation.state.index isnt 2
            <TouchableWithoutFeedback onPress={=> @onPressTab 'OrderSetting', 2}>
              <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <Image source={require '../../../../images/tab_menu_item_2.png'} style={{ width: 30, height: 30 }} />
                <Text bold marginTop={3} color="#a2aabf">주문설정</Text>
              </View>
            </TouchableWithoutFeedback>
          }
          { if 1 is 2
            <View style={{ position: 'absolute', top: 10, right: 23, borderRadius: 4, width: 7, height: 7, backgroundColor: red }} />
          }
        </View>
        <View style={{ flex: 1 }}>
          { if @props.navigation.state.index is 3
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
              <Image source={require '../../../../images/tab_menu_item_3_active.png'} style={{ width: 30, height: 30 }} />
              <Text bold marginTop={3} color={white}>입출관리</Text>
            </View>
          }
          { if @props.navigation.state.index isnt 3
            <TouchableWithoutFeedback onPress={=> @onPressTab 'Balances', 3}>
              <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <Image source={require '../../../../images/tab_menu_item_3.png'} style={{ width: 30, height: 30 }} />
                <Text bold marginTop={3} color="#a2aabf">입출관리</Text>
              </View>
            </TouchableWithoutFeedback>
          }
          { if 1 is 2
            <View style={{ position: 'absolute', top: 10, right: 23, borderRadius: 4, width: 7, height: 7, backgroundColor: red }} />
          }
        </View>
      </View>
      { if isIphoneX()
        <View style={{ height: 30, backgroundColor: darkBlue, borderTopWidth: 3, borderTopColor: '#3a4a74' }} />
      }
    </View>
