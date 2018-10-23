export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      ADMIN_APPROVAL_STATUS = @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS

      if @props.transporter.adminApprovalStatus is ADMIN_APPROVAL_STATUS.REQUESTED.VALUE
        state = 'requested'

      else if @props.transporter.adminApprovalStatus is ADMIN_APPROVAL_STATUS.UPDATE_REQUESTED.VALUE
        state = 'update requested'

      else if @props.transporter.adminApprovalStatus is ADMIN_APPROVAL_STATUS.APPROVED.VALUE
        state = 'approved'

      <WrappedComponent {...@props} state={state} />
