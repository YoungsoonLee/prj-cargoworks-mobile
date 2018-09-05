export default withReation = (WrappedComponent) =>
  observer class WithReation extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          toJs @props.state
      ,
        =>
          state.verifyPhoneNumberValue.name = @props.state.name
          state.verifyPhoneNumberValue.phoneNumber = @props.state.phoneNumber
      )

    render: =>
      <WrappedComponent {...@props} />
