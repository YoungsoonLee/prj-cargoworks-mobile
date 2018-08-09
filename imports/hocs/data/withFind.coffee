export default withFind = (collectionName, getSelector = =>, getOption = =>, option = {}) =>
  (WrappedComponent) =>
    observer class WithFind extends Component
      # @propTypes:
      #   areDocsReady: PropTypes.bool
      #   docs: PropTypes.array

      @defaultProps:
        areDocsReady: false
        docs: []

      render: =>
        _.defaults option,
          isReadyNeeded: true
          spinner: <Spinner />

        if option.isReadyNeeded and not @props.areDocsReady
          return option.spinner

        props =
          [collectionName]: @props.docs

        <WrappedComponent {...@props} {...props} />

    withTracker((props) =>
      selector = getSelector(props) or {}

      _option = getOption(props) or {}

      docsHandle = Meteor.subscribe collectionName, selector, _option

      if collectionName is 'users'
        Collection = Meteor.users

      else
        Collection = Meteor.collection collectionName

      areDocsReady: docsHandle.ready()
      docs: Collection.find(selector, _option).fetch()
    ) WithFind
