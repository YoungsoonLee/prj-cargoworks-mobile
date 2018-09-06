export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          regNumber: @props.state.value.regNumber
          regName: @props.state.value.storeName
          ownerName: @props.state.value.name
          address: @props.state.value.address
          contactNumber: @props.state.value.contactNumber
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.go 'UpdateBankAccount'


    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
