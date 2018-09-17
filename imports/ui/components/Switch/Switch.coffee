import { Switch } from 'react-native'

export default observer class _Switch extends Component
  # @propTypes:
  #   isDisabled: PropTypes.bool
  #   throttle: PropTypes.number
  #   state: PropTypes.object
  #   path: PropTypes.string

  @defaultProps:
    isDisabled: false
    throttle: 1000
    state: {}
    path: ''

  constructor: (props) ->
    super props

    @state = observable
      isChecked: _get @props.state, @props.path
      isSwitchPressed: false

    reaction(
      =>
        @state.isChecked
    ,
      =>
        _set @props.state, @props.path, @state.isChecked
    )

    reaction(
      =>
        _get @props.state, @props.path
    ,
      =>
        @state.isChecked = _get @props.state, @props.path
    )

  onChange: (isChecked) =>
    if @state.isSwitchPressed
      return

    @state.isSwitchPressed = true

    setTimeout =>
      @state.isSwitchPressed = false
    , @props.throttle

    @state.isChecked = isChecked

  render: =>
    <Switch onValueChange={@onChange} value={@state.isChecked} disabled={@props.isDisabled} />
