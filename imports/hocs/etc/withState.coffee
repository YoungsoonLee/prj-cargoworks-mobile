export default withState = (getDefaultState = =>) =>
  (WrappedComponent) =>
    observer class WithState extends Component
      constructor: (props) ->
        super props

        defaultState = getDefaultState(@props) or {}

        @state = observable defaultState

      render: =>
        <WrappedComponent {...@props} state={@state} />
