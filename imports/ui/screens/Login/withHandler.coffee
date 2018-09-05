export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressLogin: =>
      Util.login @props.state.id, @props.state.password, (error) =>
        if error
          Util.alert error.reason

          return

        Util.reset 'Main'

    onPressSignup: =>
      Util.go 'VerifyPhoneNumber'

    render: =>
      <WrappedComponent {...@props} onPressLogin={@onPressLogin} onPressSignup={@onPressSignup} />
