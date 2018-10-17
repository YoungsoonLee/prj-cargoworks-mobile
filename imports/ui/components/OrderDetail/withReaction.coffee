export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.remainedSecond
      ,
        =>
          if @props.state.remainedSecond <= 0 and @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.DESIGNATED.VALUE and @props.order.status is @props.ORDERS.STATUS.DISPATCHING.VALUE
            @props.onPressDecline()
      )

    componentWillUnmount: =>
      if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.DESIGNATED.VALUE and @props.order.status is @props.ORDERS.STATUS.DISPATCHING.VALUE
        @props.onPressDecline()

    render: =>
      <WrappedComponent {...@props} />
