export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressFilter: (filter) =>
      @props.state.filter = filter

    onPressRequestWithdraw: =>
      Util.go 'RequestWithdraw'

    render: =>
      <WrappedComponent {...@props} onPressFilter={@onPressFilter} onPressRequestWithdraw={@onPressRequestWithdraw} />
