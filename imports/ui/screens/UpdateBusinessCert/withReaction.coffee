export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.value.regNumber
      ,
        =>
          @props.state.isRegNumberValid = false
          @props.state.isRegNumberChecked = false
      )

    render: =>
      <WrappedComponent {...@props} />
