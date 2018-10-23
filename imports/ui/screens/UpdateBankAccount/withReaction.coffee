export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          JSON.stringify @props.state.value
      ,
        =>
          @props.state.isUpdated = true
      )

    render: =>
      <WrappedComponent {...@props} />
