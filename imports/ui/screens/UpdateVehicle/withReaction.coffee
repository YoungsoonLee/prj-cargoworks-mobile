export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.carNumber + @props.state.weight + @props.state.boxType + @props.state.vehicle + @props.state.carRegisterImageUrl
      ,
        =>
          @props.state.isUpdated = true
      )

    render: =>
      <WrappedComponent {...@props} />
