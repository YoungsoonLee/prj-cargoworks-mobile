export default observer class MyAgentView extends Component
  # @propTypes:
  #   myAgent: PropTypes.object
  #   isChecked: PropTypes.bool
  #   onChangeCheckbox: PropTypes.func

  @defaultProps:
    myAgent: {}
    isChecked: false
    onChangeCheckbox: =>

  onPressDecline: =>
    @props.onPressDecline()

  onChangeCheckbox: =>
    @props.onChangeCheckbox()

  render: =>
    <View style={{ height: 65, flexDirection: 'row', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
      <View style={{ width: 65, justifyContent: 'center', alignItems: 'center' }}>
        <CheckboxControlled isChecked={@props.isChecked} onChange={@onChangeCheckbox} />
      </View>
      <View style={{ flex: 1, justifyContent: 'center' }}>
        <Text bold size={18} color="#333333">{ @props.myAgent.title }</Text>
      </View>
      <View style={{ width: 75, justifyContent: 'center', alignItems: 'center' }}>
        { if @props.myAgent.type is 'invitation'
          <Button onPress={@onPressDecline} color="white and red" width={50} height={35} textSize={13} paddingHorizontal={0}>거절</Button>
        }
      </View>
    </View>
