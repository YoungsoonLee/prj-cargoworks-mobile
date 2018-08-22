import { Modal } from 'react-native'
import SelectVehicle from '../../components/SelectVehicle/SelectVehicle.coffee'

export default observer class SelectVehiclePopupView extends Component
  # @propTypes:
  #   isVisible: PropTypes.bool

  @defaultProps:
    isVisible: false

  constructor: (props) ->
    super props

    @state = observable
      isVisible: @props.isVisible
      vehicle: '오토바이'

    reaction(
      =>
        @state.isVisible
    ,
      =>
        @props.onChangeVisible @state.isVisible
    )

  componentWillUpdate: (nextProps) =>
    if not _.isEqual @props, nextProps
      @state.isVisible = nextProps.isVisible

      @state.vehicle = nextProps.vehicle

  onPressClose: =>
    @state.isVisible = false

  onChangeVehicle: (vehicles) =>
    @state.vehicle = vehicles[0]

  onPressSelect: =>
    @state.isVisible = false

    @props.onChange @state.vehicle

  render: =>
    <Modal
      animationType="slide"
      visible={@state.isVisible}
    >
      <Layout type="popup" onPressClose={@onPressClose} title="차량선택">
        <ScrollView>
          <SelectVehicle isSwitch onChange={@onChangeVehicle} vehicles={[@state.vehicle]} />
        </ScrollView>
        <Button isDisabled={not @state.vehicle} borderRadius={0} height={75} color="light blue" onPress={@onPressSelect}>
          <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <Ionicons name="ios-checkmark" color={white} size={50} />
            <Text color={white} size={20} bold marginLeft={10}>선택완료</Text>
          </View>
        </Button>
      </Layout>
    </Modal>
