export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      transportersDefaultObject = _.cloneDeep @props.transportersDefaultObject

      transportersDefaultObject.mobileNumbers[0].number = state.verifyPhoneNumberValue.phoneNumber
      transportersDefaultObject.mobileNumbers[0].isVerified = true
      transportersDefaultObject.mobileNumbers[0].isPrimary = true
      transportersDefaultObject.mobileNumbers[0].isTakenOverByOthers = false

      Meteor.call 'transporters.insert', transportersDefaultObject, (error, transporterId) =>
        if error
          Util.alert error.reason

          return

        Util.createUser
          username: @props.state.id
          password: @props.state.password
          profile:
            name: state.verifyPhoneNumberValue.name
            transporterId: transporterId
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.login @props.state.id, @props.state.password, (error, user) =>
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

              Util.reset 'UpdateVehicle'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
