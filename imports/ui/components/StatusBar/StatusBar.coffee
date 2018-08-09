import { Platform, StatusBar } from 'react-native'
import { getStatusBarHeight } from 'react-native-status-bar-height'

export default observer class _StatusBar extends Component
  # @propTypes:
  #   type: PropTypes.oneOf ['light', 'dark']
  #   backgroundColor: PropTypes.string
  #   height: PropTypes.number

  @defaultProps:
    type: 'light'
    backgroundColor: '#ffffff'
    height: if Platform.OS is 'android' then StatusBar.currentHeight else getStatusBarHeight()

  @height: if Platform.OS is 'android' then StatusBar.currentHeight else getStatusBarHeight()

  render: =>
    if @props.type is 'light'
      type = 'light-content'

    else if @props.type is 'dark'
      type = 'dark-content'

    <View style={{ backgroundColor: @props.backgroundColor, height: @props.height }}>
      <StatusBar barStyle={type} backgroundColor="transparent" translucent />
    </View>
