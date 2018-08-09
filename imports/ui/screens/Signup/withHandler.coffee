export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      Util.createUser
        username: @props.state.value.username
        password: @props.state.value.password
        profile:
          name: global.state.verifyPhoneNumberValue.name
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.login @props.state.value.username, @props.state.value.password, (error) =>
          if error
            Util.alert error.reason

            return

          Util.go 'UpdateVehicle'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
