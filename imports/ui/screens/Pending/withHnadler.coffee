export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressStart: =>
      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          adminApprovalStatus: @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.APPROVED.VALUE
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.reset 'Main'

    onPressUsage: =>
      Util.go 'Usage'

    render: =>
      <WrappedComponent {...@props} onPressStart={@onPressStart} onPressUsage={@onPressUsage} />
