export default observer class CwHeader extends Component
  # @propTypes:
  #   isBorderTopVisible: PropTypes.bool
  #   isBorderBottomVisible: PropTypes.bool

  @defaultProps:
    isBorderTopVisible: true
    isBorderBottomVisible: true

  render: =>
    <View style={{ borderTopWidth: (if @props.isBorderTopVisible then 1 else 0), borderTopColor: black, borderBottomWidth: (if @props.isBorderBottomVisible then 1 else 0), borderBottomColor: black, height: 45, backgroundColor: '#eeeeee', justifyContent: 'center', paddingLeft: 15 }}>
      <Text bold size={18} color={black}>{ @props.children }</Text>
    </View>
