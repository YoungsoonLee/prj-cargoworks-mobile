export default observer class Event extends Component
  # @propTypes:
  #   event: PropTypes.object
  #   onPress: PropTypes.func

  @defaultProps:
    event: {}
    onPress: =>

  onPress: =>
    @props.onPress()

  render: =>
    <Touchable onPress={@onPress}>
      <View>
        <Image source={{ uri: @props.event.imageFileUrl }} style={{ width: width - 20 * 2, height: width - 20 * 2, borderWidth: 1, borderColor: '#d3d3d3', borderRadius: 3 }} />
        <Text marginTop={15} size={15} color="#353198">{ moment(@props.event.dateRange.startDate).format('YYYY.MM.DD') } ~ { moment(@props.event.dateRange.endDate).format('YYYY.MM.DD') }</Text>
        <Text marginTop={7} bold size={19}>{ @props.event.title }</Text>
        <View style={{ height: 18 }} />
      </View>
    </Touchable>
