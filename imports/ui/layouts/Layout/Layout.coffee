import { TouchableWithoutFeedback, Keyboard } from 'react-native'

export default observer class Layout extends Component
  # @propTypes:
  #   isKeyboardDismissable: PropTypes.bool
  #   title: PropTypes.string
  #   isBackButtonVisible: PropTypes.bool
  #   type: PropTypes.oneOf ['screen', 'popup']
  #   onPressClose: PropTypes.func

  @defaultProps:
    isKeyboardDismissable: false
    title: ''
    isBackButtonVisible: true
    type: 'screen'
    onPressClose: =>

  onPressBack: =>
    Util.back()

  onPressBackground: =>
    Keyboard.dismiss()

  onPressClose: =>
    @props.onPressClose()

  render: =>
    <TouchableWithoutFeedback onPress={@onPressBackground} disabled={not @props.isKeyboardDismissable}>
      <View style={{ flex: 1 }}>
        <StatusBar />
        <View style={{ height: 52, backgroundColor: darkBlue, flexDirection: 'row' }}>
          <View style={{ width: 60 }}>
            { @props.isBackButtonVisible and @props.type is 'screen' and
              <Touchable onPress={@onPressBack}>
                <View style={{ flexDirection: 'row', width: 60, height: 52, justifyContent: 'center', alignItems: 'center' }}>
                  <SimpleLineIcons name="arrow-left" size={18} color="#a2aabf" />
                  <Text color="#a2aabf" marginLeft={3} size={19} bold>뒤로</Text>
                </View>
              </Touchable>
              }
          </View>
          <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
            <Text color={white} size={20} bold>{ @props.title }</Text>
          </View>
          <View style={{ width: 52, alignItems: 'center', justifyContent: 'center' }}>
            { @props.type is 'popup' and
              <Touchable onPress={@onPressClose}>
                <Text color="#a2aabf" size={19} bold>닫기</Text>
              </Touchable>
              }
          </View>
        </View>
        <View style={{ zIndex: -1, flex: 1, backgroundColor: '#ffffff' }}>
          { @props.children }
        </View>
      </View>
    </TouchableWithoutFeedback>
