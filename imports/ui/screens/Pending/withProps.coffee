export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      if @props.transporter.adminApprovalStatus is @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.REQUESTED.VALUE
        state = 'requested'

      else if @props.transporter.adminApprovalStatus is @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.APPROVED.VALUE
        state = 'approved'

      if not isProduction
        state = 'approved'

      <WrappedComponent {...@props} state={state} />
