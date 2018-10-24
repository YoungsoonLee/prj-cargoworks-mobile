export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressFilter: (filter) =>
      @props.state.filter = filter

    onPressRequestWithdraw: =>
      Util.go 'RequestWithdraw'

    onPressBalance: (balance) =>
      Util.go 'Balance',
        id: balance._id

    onPressStartDate: =>
      @props.onPressSelectStartDateModal =>
        @props.state.filter = '지정'

    onPressEndDate: =>
      @props.onPressSelectEndDateModal =>
        @props.state.filter = '지정'

    render: =>
      <WrappedComponent {...@props} onPressFilter={@onPressFilter} onPressRequestWithdraw={@onPressRequestWithdraw} onPressBalance={@onPressBalance} onPressStartDate={@onPressStartDate} onPressEndDate={@onPressEndDate} />
