export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      transportersDefaultObject = _.cloneDeep @props.transportersDefaultObject

      Meteor.call 'transporters.insert', transportersDefaultObject, (error, transporterId) =>
        if error
          Util.alert error.reason

          return

        console.log transporterId

        Util.createUser
          username: @props.state.value.username
          password: @props.state.value.password
          profile:
            name: global.state.verifyPhoneNumberValue.name
            transporterId: transporterId
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.login @props.state.value.username, @props.state.value.password, (error, user) =>
            if error
              Util.alert error.reason

              return

            Meteor.call 'transporters.update',
              _id: transporterId
            ,
              $set:
                userId: user._id
            , (error) =>
              if error
                Util.alert error.reason

                return

              Util.go 'UpdateVehicle'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
