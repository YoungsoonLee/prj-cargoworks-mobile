export default withDefaultObject = (collectionName) =>
  (WrappedComponent) =>
    observer class WithDefaultObject extends Component
      constructor: (props) ->
        super props

        @state = observable
          isDefaultObjectReady: false
          defaultObject: {}

      componentWillMount: =>
        Meteor.call "#{collectionName}.getDefaultObject", (error, defaultObject) =>
          if error
            utils.alert error.reason

            return

          @state.defaultObject = defaultObject

          @state.isDefaultObjectReady = true

      render: =>
        if not @state.isDefaultObjectReady
          return null

        props =
          ["#{collectionName}DefaultObject"]: toJs @state.defaultObject

        <WrappedComponent {...@props} {...props}  />
