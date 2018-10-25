export default observer class Hello extends Component
  constructor: (props) ->
    super props

    @state = observable
      count: 0

  onPress: =>
    @state.count += 1

    state.count += 1

  render: =>
    <View>
      <Text onPress={@onPress}>Click Me</Text>
      <Text>You{'\''}ve pressed the button { @state.count } { state.count } times.</Text>
    </View>
