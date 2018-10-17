export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.remainedSecond
      ,
        =>
          if @props.state.remainedSecond <= 0
            @cancelOrder()
      )

    componentWillUnmount: =>
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
