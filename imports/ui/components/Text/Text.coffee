import { Text, Platform } from 'react-native'

export default observer class _Text extends Component
  # @propTypes:
  #   color: PropTypes.string
  #   size: PropTypes.number
  #   marginTop: PropTypes.number
  #   marginLeft: PropTypes.number
  #   bold: PropTypes.bool
  #   underline: PropTypes.bool
  #   onPress: PropTypes.func
  #   white: PropTypes.bool
  #   center: PropTypes.bool
  #   right: PropTypes.bool
  #   opacity: PropTypes.number
  #   style: PropTypes.object

  @defaultProps:
    color: '#333333'
    size: 13
    marginTop: 0
    marginLeft: 0
    bold: false
    underline: false
    onPress: null
    white: false
    center: false
    right: false
    opacity: 1
    style: {}

  render: =>
    color = @props.color

    if @props.white
      color = '#ffffff'

    if @props.center
      textAlign = 'center'

    else if @props.right
      textAlign = 'right'

    else
      textAlign = 'left'

    style =
      textAlign: textAlign
      color: color
      fontSize: @props.size
      marginTop: @props.marginTop
      marginLeft: @props.marginLeft
      fontWeight: if @props.bold then 'bold' else 'normal'
      textDecorationLine: if @props.underline then 'underline' else 'none'
      opacity: @props.opacity
      fontFamily: if Platform.OS is 'android' then 'sans-serif' else 'Apple SD Gothic Neo'

    _.extend style, @props.style

    <Text onPress={@props.onPress} style={style}>{ @props.children }</Text>
