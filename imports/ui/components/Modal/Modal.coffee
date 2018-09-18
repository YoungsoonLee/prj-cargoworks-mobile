import { Keyboard, TouchableWithoutFeedback, Modal } from 'react-native'
import EvilIcons from 'react-native-vector-icons/EvilIcons'

export default observer class _Modal extends Component
  # @propTypes:
  #   width: PropTypes.oneOfType [PropTypes.number, PropTypes.string]
  #   onPressClose: PropTypes.func

  @defaultProps:
    width: '80%'
    onPressClose: =>

  constructor: (props) ->
    super props

    @state = observable
      isVisible: false

  open: =>
    @state.isVisible = true

  close: =>
    @state.isVisible = false

  onPressClose: =>
    @state.isVisible = false

    @props.onPressClose()

  render: =>
    <Modal
      animationType="slide"
      transparent
      visible={@state.isVisible}
    >
      <TouchableWithoutFeedback onPress={=> Keyboard.dismiss()}>
        <View style={{ flex: 1, backgroundColor: 'rgba(0, 0, 0, 0.5)', justifyContent: 'center', alignItems: 'center' }}>
          <View style={{ width: @props.width, backgroundColor: white }}>
            <View style={{ height: 40, alignItems: 'flex-end' }}>
              <TouchableWithoutFeedback onPress={@onPressClose}>
                <View style={{ width: 40, height: 40, justifyContent: 'center', alignItems: 'center' }}>
                  <EvilIcons name="close" color="#9b9b9b" size={35} />
                </View>
              </TouchableWithoutFeedback>
            </View>
            { @props.children }
          </View>
        </View>
      </TouchableWithoutFeedback>
    </Modal>
