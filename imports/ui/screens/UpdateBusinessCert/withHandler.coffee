export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      if not @props.state.isRegNumberChecked
        Util.alert '사업자 등록번호를 확인해주시기 바랍니다'

        return

      if not @props.state.isRegNumberValid
        Util.alert '사업자 등록번호가 유효하지 않습니다'

        return

      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          regNumber: @props.state.value.regNumber
          regName: @props.state.value.storeName
          ownerName: @props.state.value.name
          address: @props.state.value.address
          phoneNumber: @props.state.value.contactNumber
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.go 'UpdateBankAccount'


    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
