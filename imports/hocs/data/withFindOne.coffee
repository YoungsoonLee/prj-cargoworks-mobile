export default withFindOne = (collectionName, getSelector = =>, getOption = =>, option = {}) =>
  (WrappedComponent) =>
    observer class WithFindOne extends Component
      # @propTypes:
      #   isDocReady: PropTypes.bool
      #   doc: PropTypes.object

      @defaultProps:
        isDocReady: false
        doc: {}

      render: =>
        _.defaults option,
          isReadyNeeded: true
          isDocNeeded: true
          spinner: <Spinner />

        if option.isReadyNeeded and not @props.isDocReady
          return option.spinner

        if option.isDocNeeded and not @props.doc._id
          return option.spinner

        if option.propName
          props =
            [option.propName]: @props.doc

        else
          props =
            [collectionName.slice 0, -1]: @props.doc

        <WrappedComponent {...@props} {...props} />

    withTracker((props) =>
      selector = getSelector(props) or {}

      _option = getOption(props) or {}

      docHandle = Meteor.subscribe collectionName, selector, _option

      if collectionName is 'users'
        Collection = Meteor.users

      else
        Collection = Meteor.collection collectionName

      isDocReady: docHandle.ready()
      doc: Collection.findOne(selector, _option) or {}
    ) WithFindOne
