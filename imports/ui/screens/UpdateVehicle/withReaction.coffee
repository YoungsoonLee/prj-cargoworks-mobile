export default withReaction = (WrappedComponent) =>
  observer class WithReaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.carNumber + @props.state.carNumber.weight + @props.state.carNumber.boxType + @props.state.carNumber.vehicle + @props.state.carNumber.carRegisterImageUrl
      ,
        =>
          @props.state.isUpdated = true
      )

    render: =>
      <WrappedComponent {...@props} />
