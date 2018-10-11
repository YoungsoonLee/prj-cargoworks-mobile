export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressMenuItem: (menuItem) =>
      Util.go menuItem.screen, menuItem.param

    onPressInOrOut: (isIn) =>
      if isIn
        operationStatus = @props.TRANSPORTERS.OPERATION_STATUS.IN.VALUE

      else
        operationStatus = @props.TRANSPORTERS.OPERATION_STATUS.OUT.VALUE

      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $set:
          operationStatus: operationStatus
      , (error) =>
        if error
          Util.alert error.reason

    render: =>
      <WrappedComponent {...@props} onPressMenuItem={@onPressMenuItem} onPressInOrOut={@onPressInOrOut} />
