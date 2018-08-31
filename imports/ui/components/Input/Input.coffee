import { TextInput, Platform } from 'react-native'

export default observer class Input extends Component
  @propTypes:
    placeholder: PropTypes.string
    marginTop: PropTypes.number
    maxLength: PropTypes.number
    onFocus: PropTypes.func
    onBlur: PropTypes.func
    isDisabled: PropTypes.bool
    type: PropTypes.oneOf ['text', 'number', 'password']
    state: PropTypes.object
    name: PropTypes.string

  @defaultProps:
    placeholder: ''
    marginTop: 0
    maxLength: 50
    onFocus: () => {}
    onBlur: () => {}
    isDisabled: false
    type: 'text'
    state: {}
    # placeholderColor: '#3c4f5e',
    # underlineColor: '#cfcfcf',
    # focusedPlaceholderColor: '#cfcfcf',
    # focusedUnderlineColor: '#4d4d4d',
    # selectionColor: '#4d4d4d',
    # errorColor: '#d0021b',
    # textColor: '#4d4d4d',
    name: ''

  constructor: (props) ->
    super props

    @state = observable
      value: ''

    reaction(
      =>
        @state.
    ,
      =>
        @props
    )

  onFocus: =>
    @props.onFocus @props.name

  onBlur: =>
    @props.onFocus @props.name

  render: =>
    if @props.type is 'email'
      keyboardType = 'email-address'

    else if @props.type is 'number'
      keyboardType = 'numeric'

    else
      keyboardType = 'text'

    <View style={[{ justifyContent: 'flex-end', height: 50, borderBottomWidth: 1, borderBottomColor: this.animatedBorderBottomColor, marginTop: this.props.marginTop }, this.state.overlaidBorderBottomStyle ]}>
      <View style={{ position: 'absolute', top: 15, transform: [{ translateY: this.animatedTranslateY }], flexDirection: 'row' }}>
        <Text style={{ fontSize: this.animatedFontSize, color: this.animatedColor, fontFamily: Platform.OS == 'android' ? 'sans-serif' : 'Apple SD Gothic Neo' }}>
          { this.props.placeholder }
        </Text>
        { this.state.error != 'blank' && !!this.state.error &&
          <Font.H6 fontSize={10} color={this.props.errorColor} marginLeft={5}>{ this.state.error }</Font.H6>
        }
      </View>
      <TextInput
        ref={(ref) => { this.textInputRef = ref; }}
        onFocus={this.onFocus}
        onBlur={this.onBlur}
        onChangeText={this.onChangeText}
        style={{ height: 40, paddingTop: 10, color: this.props.textColor }}
        maxLength={this.props.max}
        keyboardType={keyboardType}
        selectionColor={this.props.selectionColor}
        secureTextEntry={this.props.type == 'password' ? true : this.props.isSecure}
        autoCapitalize="none"
        autoCorrect={false}
        editable={!this.props.isDisabled}
        value={this.state.text}
        underlineColorAndroid="transparent"
      />
    </View>
