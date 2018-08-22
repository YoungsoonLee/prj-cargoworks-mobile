import Ionicons from 'react-native-vector-icons/Ionicons'

export default observer class ListItem extends Component
  # @propTypes:
  #   subTitle: PropTypes.string
  #   isBorderTopVisible: PropTypes.bool
  #   isBorderBottomVisible: PropTypes.bool
  #   name: PropTypes.string
  #   onPress: PropTypes.func

  @defaultProps:
    subTitle: ''
    isBorderTopVisible: false
    isBorderBottomVisible: true
    name: ''
    onPress: =>

  onPress: =>
    @props.onPress @props.name

  render: =>
    <Touchable onPress={@onPress}>
      <View style={{ height: 80, paddingHorizontal: 15, flexDirection: 'row', borderTopWidth: @props.isBorderTopVisible and 1, borderTopColor: '#a6a6a6', borderBottomWidth: @props.isBorderBottomVisible and 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ flex: 1, justifyContent: 'center' }}>
          <Text size={20} bold color={black}>{ @props.children }</Text>
          { not not @props.subTitle and
            <Text marginTop={3}>{ @props.subTitle }</Text>
            }
        </View>
        <View style={{ width: 30, alignItems: 'flex-end', justifyContent: 'center' }}>
          <Ionicons name="ios-arrow-forward" size={20} />
        </View>
      </View>
    </Touchable>
