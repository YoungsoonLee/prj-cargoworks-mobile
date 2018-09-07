export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      if @props.state.value.method is '수신안함'
        method = ''

      else
        method = @props.state.value.method

      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          'withdrawalAccount.bank': @props.state.value.bank
          'withdrawalAccount.accountNumber': @props.state.value.accountNumber
          'withdrawalAccount.holderName': @props.state.value.holderName
          taxationMethod: method
          taxationRegistrationNumber: @props.state.value.number
          adminApprovalStatus: @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.REQUESTED.VALUE
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.reset 'Pending'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
