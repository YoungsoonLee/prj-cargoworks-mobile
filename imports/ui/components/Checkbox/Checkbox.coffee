import { View } from 'react-native'
import CheckBox from 'react-native-check-box'
import Ionicons from 'react-native-vector-icons/Ionicons'

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
  #   isRadio: PropTypes.bool

  @defaultProps:
    isChecked: false
    onChange: =>
    name: ''
    color: null
    label: <View />
    marginTop: 0
    marginLeft: 0
    isDisabled: false
    isRadio: false

  constructor: (props) ->
    super props

    @state = observable
      isChecked: @props.isChecked

  componentWillUpdate: (nextProps) =>
    if not _.isEqual @props, nextProps
      @state.isChecked = nextProps.isChecked

  onPressCheckbox: =>
    if @props.isRadio
      @state.isChecked = true

    else
      @state.isChecked = not @state.isChecked

    @props.onChange @state.isChecked, @props.name

  render: =>
    <View style={{ flexDirection: 'row', marginTop: @props.marginTop, marginLeft: @props.marginLeft }}>
      <TouchableWithoutFeedback onPress={@onPressCheckbox}>
        <View style={{ width: 40, alignItems: 'center', justifyContent: 'center' }}>
          <Ionicons name="ios-checkbox" size={32} color={if @state.isChecked then '#c12d3a' else '#cccccc'} />
        </View>
      </TouchableWithoutFeedback>
      <View style={{ flex: 1, paddingLeft: 10, justifyContent: 'center' }}>
        { @props.label }
      </View>
    </View>
