import { View } from 'react-native'
import CheckBox from 'react-native-check-box'

export default observer class Checkbox extends Component
  # @propTypes:
  #   isChecked: PropTypes.bool
  #   onChange: PropTypes.func
  #   name: PropTypes.string
  #   color: PropTypes.string
  #   label: PropTypes.element
  #   marginTop: PropTypes.number
  #   marginLeft: PropTypes.number
  #   isDisabled: PropTypes.bool

  @defaultProps:
    isChecked: false
    onChange: =>
    name: ''
    color: null
    label: <View />
    marginTop: 0
    marginLeft: 0
    isDisabled: false

  constructor: (props) ->
    super props

    @state = observable
      isChecked: @props.isChecked

  onClick: =>
    @state.isChecked = not @state.isChecked

    @props.onChange @state.isChecked, @props.name

  render: =>
    <CheckBox
      style={{ marginTop: @props.marginTop, marginLeft: @props.marginLeft }}
      checkBoxColor={@props.color}
      rightTextView={
        <View style={{ marginLeft: 10 }}>
          { @props.label }
        </View>
      }
      onClick={@onClick}
      isChecked={@state.isChecked}
      disabled={@props.isDisabled}
    />
