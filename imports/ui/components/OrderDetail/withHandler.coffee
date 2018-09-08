export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressOk: =>
      if @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.IMMEDIATE.VALUE
        status = @props.ORDERS.STATUS.PICKINGUP.VALUE

      else if @props.order.waypoints.pickUpSchedule is @props.ORDERS.PICKUP_SCHEDULE.RESERVED.VALUE
        status = @props.ORDERS.STATUS.BEFORE_PICKUP.VALUE

      Meteor.call 'orders.update',
        _id: @props.order._id
      ,
        $set:
          transporter: @props.transporter
          status: status
          'waypoints.addresses.0.isActive': true
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.back()

        setTimeout =>
          Util.og 'MyOrders'
        , 500

    render: =>
      <WrappedComponent {...@props} onPressOk={@onPressOk} />
