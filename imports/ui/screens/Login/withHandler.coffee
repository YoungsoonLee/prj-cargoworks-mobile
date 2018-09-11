export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressLogin: =>
      Util.login @props.state.id, @props.state.password, (error, user) =>
        if error
          Util.alert error.reason

          return

        Meteor.call 'transporters.findOne',
          _id: user.profile.transporterId
        , (error, transporter) =>
          if error
            Util.alert error.reason

            return

          Util.goToInitialScreen user, transporter, @props.TRANSPORTERS

    onPressSignup: =>
      Util.go 'VerifyPhoneNumber'

    render: =>
      <WrappedComponent {...@props} onPressLogin={@onPressLogin} onPressSignup={@onPressSignup} />
