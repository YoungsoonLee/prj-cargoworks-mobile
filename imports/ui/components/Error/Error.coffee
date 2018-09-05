export default observer class Error extends Component
  # @propTypes:
  #   error: PropTypes.string

  @defaultProps:
    error: ''

  render: =>
    <View>
      { @props.children }
      <View style={{ height: 15 }}>
        <Text size={12} color="#d0021b" marginLeft={5}>{ @props.error }</Text>
      </View>
    </View>
