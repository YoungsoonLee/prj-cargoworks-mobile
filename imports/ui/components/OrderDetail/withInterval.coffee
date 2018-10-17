export default withInterval = (WrappedComponent) =>
  observer class WithInterval extends Component
    componentDidMount: =>
      if @props.order.status is @props.ORDERS.STATUS.DISPATCHING.VALUE and @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.DESIGNATED.VALUE
        @intervalId = setInterval =>
          if @props.state.remainedSecond > 0
            @props.state.remainedSecond = @props.state.remainedSecond - 0.2
        , 200

    componentWillUnmount: =>
      clearInterval @intervalId

    render: =>
      <WrappedComponent {...@props} />
