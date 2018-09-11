export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      Meteor.call 'transporters.update',
        _id: @props.user.profile.transporterId
      ,
        $set:
          hasAgreedForCargoInsurance: @props.state.isAgreeChecked
          cargoInsuranceInsuredName: @props.state.name
          residentRegNumber: @props.state.idNumber
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.go 'UpdateBusinessCert'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
