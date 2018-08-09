export default withConstant = (collectionName) =>
  (WrappedComponent) =>
    observer class WithConstant extends Component
      constructor: (props) ->
        super props

        @state = observable
          isConstantReady: false
          constant: {}

      componentWillMount: =>
        Meteor.call "#{collectionName}.getConstant", (error, constant) =>
          if error
            utils.alert error.reason

            return

          @state.constant = constant

          @state.isConstantReady = true

      render: =>
        if not @state.isConstantReady
          return null

        props =
          ["#{_.upperCase(collectionName).replace /\s/g, '_'}"]: toJs @state.constant

        <WrappedComponent {...@props} {...props}  />
