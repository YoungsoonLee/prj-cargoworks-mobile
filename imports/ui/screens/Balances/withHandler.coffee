export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressFilter: (filter) =>
      @props.state.filter = filter

    onPressRequestWithdraw: =>
      Util.go 'RequestWithdraw'

    onPressBalance: (balance) =>
      Util.go 'Balance',
        id: balance._id

    render: =>
      <WrappedComponent {...@props} onPressFilter={@onPressFilter} onPressRequestWithdraw={@onPressRequestWithdraw} onPressBalance={@onPressBalance} />
