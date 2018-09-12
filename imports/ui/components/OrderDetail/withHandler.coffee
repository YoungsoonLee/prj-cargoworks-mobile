export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressOk: =>
      Meteor.call 'orders.update.transporter.dispatched', @props.order._id, @props.transporter._id, (error) =>
        if error
          Util.alert error.reason

          return

        state.lazyLoadFlags[1] = true

        state.tab.screen = 'MyOrders'

        Util.back()

        setTimeout =>
          Util.og 'MyOrders'
        , 500

    render: =>
      <WrappedComponent {...@props} onPressOk={@onPressOk} />
