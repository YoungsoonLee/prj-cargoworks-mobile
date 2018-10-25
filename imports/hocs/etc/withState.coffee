export default withState = (getDefaultState = =>, propName = 'state') =>
  (WrappedComponent) =>
    observer class WithState extends Component
      constructor: (props) ->
        super props

        defaultState = getDefaultState(@props) or {}

        @state = observable defaultState

      render: =>
        prop =
          [propName]: @state
          
        <WrappedComponent {...@props} {...prop} />
