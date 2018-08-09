export default observer class Button extends Component
  # @propTypes:
  #   colors: PropTypes.array
  #   color: PropTypes.string
  #   buttonColor: PropTypes.string
  #   textColor: PropTypes.string
  #   textSize: PropTypes.number
  #   isTextBold: PropTypes.bool
  #   borderRadius: PropTypes.number
  #   borderWidth: PropTypes.number
  #   borderColor: PropTypes.string
  #   buttonStyle: PropTypes.object
  #   textStyle: PropTypes.object
  #   isDisabled: PropTypes.bool
  #   onPress: PropTypes.func
  #   marginTop: PropTypes.number
  #   marginLeft: PropTypes.number
  #   elevation: PropTypes.number
  #   name: PropTypes.string
  #   width: PropTypes.number
  #   height: PropTypes.number
  #   paddingHorizontal: PropTypes.number
  #   debounce: PropTypes.number
  #   error: PropTypes.string

  @defaultProps:
    colors: []
    color: ''
    buttonColor: '#4d4d4d'
    textColor: '#ffffff'
    textSize: 16
    isTextBold: false
    borderRadius: 3
    borderWidth: 1
    borderColor: null
    buttonStyle: {}
    textStyle: {}
    isDisabled: false
    onPress: =>
    marginTop: 0
    marginLeft: 0
    elevation: 0
    name: ''
    width: null
    height: 45
    paddingHorizontal: 15
    debounce: 500
    error: ''

  constructor: (props) ->
    super props

    @state = observable
      isPressed: false

  onPress: =>
    if @state.isPressed
      return

    @state.isPressed = true

    setTimeout =>
      @state.isPressed = false
    , @props.debounce

    if @props.error
      Util.alert @props.error

      return

    @props.onPress @props.name

  render: =>
    color = @props.colors.find (color) =>
      color.name is @props.color

    if color
      buttonColor = color.buttonColor

      textColor = color.textColor

      borderColor = color.borderColor

    if @props.isDisabled
      buttonColor = '#cccccc'

      textColor = '#ffffff'

    <Touchable onPress={@onPress} isDisabled={@props.isDisabled} debounce={@props.debounce}>
      <View
        style={[
          alignItems: 'center'
          justifyContent: 'center'
          borderRadius: @props.borderRadius
          borderWidth: if borderColor or @props.borderColor then @props.borderWidth else 0
          borderColor: borderColor or @props.borderColor
          backgroundColor: buttonColor or @props.buttonColor
          marginTop: @props.marginTop
          marginLeft: @props.marginLeft
          elevation: @props.elevation
          shadowOpacity: if @props.elevation then 0.3 else 0
          shadowRadius: if @props.elevation then 4 else 0
          shadowOffset:
            width: @props.elevation
            height: @props.elevation
          width: @props.width
          height: @props.height
          paddingHorizontal: @props.paddingHorizontal
        ,
          @props.buttonStyle
        ]}
      >
        { typeof @props.children is 'string' and
          <Text
            color={textColor or @props.textColor}
            size={@props.textSize}
            style={@props.textStyle}
            bold={@props.isTextBold}
          >
            { @props.children }
          </Text>
          }
        { typeof @props.children isnt 'string' and @props.children }
      </View>
    </Touchable>
