export default withValidation = (names) =>
  (WrappedComponent) =>
    observer class WithValidation extends Component
      constructor: (props) ->
        super props

        validation =
          isValid: false

        names.forEach (name) =>
          validation[name] = false

        @state = observable
          validation: validation

        reaction(
          =>
            @validate()
        ,
          =>
            @state.validation.isValid = @validate()
        )

      validate: =>
        isValids = names.map (name) =>
          @state.validation[name]

        _.every isValids, Boolean

      render: =>
        <WrappedComponent {...@props} validation={@state.validation} />
