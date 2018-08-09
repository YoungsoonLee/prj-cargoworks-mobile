import { Modal } from 'react-native'

export default observer class SelectVehiclePopupView extends Component
  # @propTypes:
  #   isVisible: PropTypes.bool

  @defaultProps:
    isVisible: false

  constructor: (props) ->
    super props

    @state = observable
      isVisible: @props.isVisible
      tabIndex: 0
      weight: null
      boxType: null

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

  onPressClose: =>
    @state.isVisible = false

  onPressTab: (tabIndex) =>
    @state.tabIndex = tabIndex

  renderFreights: =>
    weights = []

    _.forEach @props.TRANSPORTERS.VEHICLES.FREIGHT.WEIGHTS, (WEIGHT) =>
      index = 0

      [0..2].forEach (index) =>
        if index is 0
          boxTypeText = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.CARGO.TEXT

          boxTypeValue = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.CARGO.VALUE

        else if index is 1
          boxTypeText = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.TOP.TEXT

          boxTypeValue = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.TOP.VALUE

        else if index is 2
          boxTypeText = '냉탑'

          boxTypeValue = @props.TRANSPORTERS.VEHICLES.FREIGHT.BOX_TYPES.FREEZER.VALUE

        if WEIGHT.VALUE isnt 'TRAILER'
          weights.push <Button onPress={=> @onPressVehicle WEIGHT, { VALUE: boxTypeValue, TEXT: boxTypeText } } paddingHorizontal={0} height={50} marginLeft={index % 3 isnt 0 and 5} width={(width - 20 * 2 - 5 * 3 - 5) / 4} color={if @state.weight?.VALUE is WEIGHT.VALUE and @state.boxType?.VALUE is boxTypeValue then 'blue' else 'white'} marginTop={5} textSize={13}>{ "#{WEIGHT.TEXT} #{boxTypeText}" }</Button>

        index++

      if WEIGHT.VALUE is 'TRAILER'
        weights.push <Button color={if @state.weight?.VALUE is WEIGHT.VALUE then 'blue' else 'white'} onPress={=> @onPressVehicle WEIGHT } height={50} marginLeft={5} width={(width - 20 * 2 - 5 * 3 - 5) / 4} marginTop={5} textSize={13}>{ "#{WEIGHT.TEXT}" }</Button>

    _weights = []

    weights.forEach (weight, index) =>
      _weights.push weight

      if index % 3 is 2 and index isnt 29
        _weights.push <View style={{ width: (width - 10 * 2 - 5 * 2 - 5) / 4 }} />

    _weights

  renderParcels: =>
    _.map @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
      <Button onPress={=> @onPressVehicle WEIGHT } color={if @state.weight?.VALUE is WEIGHT.VALUE then 'blue' else 'white'} marginTop={5} textSize={16}>{ WEIGHT.TEXT }</Button>

  onPressVehicle: (weight, boxType) =>
    @state.weight = weight

    @state.boxType = boxType

  onPressSelect: =>
    @state.isVisible = false

    @props.onChange @state.weight, @state.boxType

  render: =>
    <Modal
      animationType="slide"
      visible={@state.isVisible}
    >
      <Layout type="popup" onPressClose={@onPressClose} title="차량선택">
        <View style={{ flex: 1, paddingHorizontal: 20, paddingBottom: 20 }}>
          <View style={{ height: 56, flexDirection: 'row' }}>
            <TouchableWithoutFeedback onPress={=> @onPressTab 0}>
              <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', borderBottomWidth: 3, borderBottomColor: if @state.tabIndex is 0 then '#333333' else '#cccccc' }}>
                <Text size={20} bold color={if @state.tabIndex is 0 then '#333333' else '#cccccc'}>{ @props.TRANSPORTERS.VEHICLES.PARCEL.TEXT }</Text>
              </View>
            </TouchableWithoutFeedback>
            <TouchableWithoutFeedback onPress={=> @onPressTab 1}>
              <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', borderBottomWidth: 3, borderBottomColor: if @state.tabIndex is 1 then '#333333' else '#cccccc' }}>
                <Text size={20} bold color={if @state.tabIndex is 1 then '#333333' else '#cccccc'}>{ @props.TRANSPORTERS.VEHICLES.FREIGHT.TEXT }</Text>
              </View>
            </TouchableWithoutFeedback>
          </View>
          { @state.tabIndex is 0 and
            <View style={{ flex: 1, marginTop: 10 }}>
              { @renderParcels() }
            </View>
            }
          { @state.tabIndex is 1 and
            <ScrollView style={{ marginTop: 10 }}>
              <View style={{ flexWrap: 'wrap', flexDirection: 'row' }}>
                { @renderFreights() }
              </View>
            </ScrollView>
            }
        </View>
        <Button isDisabled={not @state.weight} borderRadius={0} height={75} color="light blue" onPress={@onPressSelect}>
          <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <Ionicons name="ios-checkmark" color={white} size={50} />
            <Text color={white} size={20} bold marginLeft={10}>선택완료</Text>
          </View>
        </Button>
      </Layout>
    </Modal>
