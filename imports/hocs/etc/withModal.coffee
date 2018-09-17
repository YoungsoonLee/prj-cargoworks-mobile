import { Modal, TouchableWithoutFeedback, Keyboard } from 'react-native'
import EvilIcons from 'react-native-vector-icons/EvilIcons'

export default withModal = (Content, option = {}) =>
  (WrappedComponent) =>
    observer class WithModal extends Component
      constructor: (props) ->
        super props

        @state = observable
          isVisible: false

      onPressClose: =>
        @state.isVisible = false

      show: =>
        @state.isVisible = true

      close: =>
        @state.isVisible = false

      render: =>
        _.defaults option,
          width: '80%'
          modalName: 'modal'

        prop =
          [option.modalName]: @

        <View style={{ flex: 1 }}>
          <Modal
            animationType="fade"
            transparent
            visible={@state.isVisible}
          >
            <TouchableWithoutFeedback onPress={=> Keyboard.dismiss()}>
              <View style={{ flex: 1, backgroundColor: 'rgba(0, 0, 0, 0.5)', justifyContent: 'center', alignItems: 'center' }}>
                <View style={{ width: option.width, backgroundColor: white }}>
                  <View style={{ height: 40, alignItems: 'flex-end' }}>
                    <TouchableWithoutFeedback onPress={@onPressClose}>
                      <View style={{ width: 40, height: 40, justifyContent: 'center', alignItems: 'center' }}>
                        <EvilIcons name="close" color="#9b9b9b" size={35} />
                      </View>
                    </TouchableWithoutFeedback>
                  </View>
                  { <Content {...@props} {...prop} /> }
                </View>
              </View>
            </TouchableWithoutFeedback>
          </Modal>
          <WrappedComponent {...@props} {...prop} />
        </View>
