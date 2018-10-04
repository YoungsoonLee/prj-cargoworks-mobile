import { TextInput, Platform } from 'react-native'

export default observer class Input extends Component
  # @propTypes:
  #   placeholder: PropTypes.string
  #   marginTop: PropTypes.number
  #   maxLength: PropTypes.number
  #   onFocus: PropTypes.func
  #   onBlur: PropTypes.func
  #   isDisabled: PropTypes.bool
  #   type: PropTypes.oneOf ['text', 'number', 'password']
  #   state: PropTypes.object
  #   path: PropTypes.string
  #   name: PropTypes.string
  #   returnKeyType: PropTypes.oneOf ['done', 'send']

  @defaultProps:
    placeholder: ''
    marginTop: 0
    maxLength: 50
    onFocus: () => {}
    onBlur: () => {}
    isDisabled: false
    type: 'text'
    state: {}
    path: 'path'
    name: ''
    returnKeyType: 'done'

  constructor: (props) ->
    super props

    value = _get @props.state, @props.path

    @state = observable
      value: value
      isFocused: if value then true else false

    reaction(
      =>
        @state.value
    ,
      =>
        _set @props.state, @props.path, @state.value
    )

    reaction(
      =>
        _get @props.state, @props.path
    ,
      =>
        @state.value = _get @props.state, @props.path
    )

  onFocus: =>
    @state.isFocused = true

    @props.onFocus @props.name

  onBlur: =>
    @state.isFocused = false

    @props.onFocus @props.name

  onChange: (value) =>
    @state.value = value

  render: =>
    if @props.type is 'email'
      keyboardType = 'email-address'

    else if @props.type is 'number'
      keyboardType = 'numeric'

    else
      keyboardType = 'default'

    <View style={{ height: 45, borderBottomWidth: 1, borderBottomColor: (if @state.isFocused then @props.color else '#cfcfcf'), marginTop: @props.marginTop }}>
      <TextInput
        returnKeyType={@props.returnKeyType}
        onFocus={@onFocus}
        onBlur={@onBlur}
        onChangeText={@onChange}
        style={{ height: 40, fontSize: 16 }}
        placeholder={@props.placeholder}
        maxLength={@props.maxLength}
        keyboardType={keyboardType}
        selectionColor={@props.color}
        secureTextEntry={@props.type is 'password'}
        autoCapitalize="none"
        autoCorrect={false}
        editable={not @props.isDisabled}
        value={@state.value}
        underlineColorAndroid="transparent"
      />
    </View>
