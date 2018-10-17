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
            @cancelOrder()
      )

    componentWillUnmount: =>
      if @props.order.dispatchType is @props.ORDERS.DISPATCH_TYPES.DESIGNATED.VALUE and @props.order.status is @props.ORDERS.STATUS.DISPATCHING.VALUE
        @cancelOrder()

    cancelOrder: =>
      Meteor.call 'orders.update',
        _id: @props.order._id
      ,
        $set:
          status: 'CANCELED'
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.back()

    render: =>
      <WrappedComponent {...@props} />
