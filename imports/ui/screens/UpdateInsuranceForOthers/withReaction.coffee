export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.isAlreadyRegistered
      ,
        =>
          if @props.state.isAlreadyRegistered
            @props.state.isAgreeChecked = false
      )

      reaction(
        =>
          @props.state.isAgreeChecked
      ,
        =>
          if @props.state.isAgreeChecked
            @props.state.isAlreadyRegistered = false
      )

    render: =>
      <WrappedComponent {...@props} />
