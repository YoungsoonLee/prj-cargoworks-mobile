import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class CheckboxControlled extends Component
  # @propTypes:
  #   color: PropTypes.string
  #   label: PropTypes.oneOfType [PropTypes.string, PropTypes.element]
  #   marginTop: PropTypes.number
  #   marginLeft: PropTypes.number
  #   isDisabled: PropTypes.bool
  #   isRadio: PropTypes.bool
  #   onChange: PropTypes.func
  #   isChecked: PropTypes.bool
  #   name: PropTypes.string

  @defaultProps:
    color: null
    label: ''
    marginTop: 0
    marginLeft: 0
    isDisabled: false
    isRadio: false
    state: {}
    path: 'path'
    onChange: =>
    isChecked: false
    name: ''

  onPress: =>
    if @props.isRadio
      @props.onChange true, @props.name

    else
      @props.onChange not @props.isChecked, @props.name

  render: =>
    if typeof @props.label is 'string'
      label = <Text>{ @props.label }</Text>

    else
      label = @props.label

    <View style={{ flexDirection: 'row', marginTop: @props.marginTop, marginLeft: @props.marginLeft }}>
      <TouchableWithoutFeedback onPress={@onPress}>
        <View style={{ width: 40, alignItems: 'center', justifyContent: 'center' }}>
          <Ionicons name="ios-checkbox" size={32} color={if @props.isChecked then '#c12d3a' else '#cccccc'} />
        </View>
      </TouchableWithoutFeedback>
      { if @props.label
        <View style={{ flex: 1, paddingLeft: 10, justifyContent: 'center' }}>
          { label }
        </View>
      }
    </View>
