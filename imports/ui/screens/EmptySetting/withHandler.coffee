export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressResetDate: =>
      @props.state.startDate = null

    onPressResetTime: =>
      @props.state.startTime = null

    render: =>
      <WrappedComponent {...@props} onPressResetDate={@onPressResetDate} onPressResetTime={@onPressResetTime} />
