export default withHocs = (getHocs) =>
  (WrappedComponent) =>
    observer class WithHocs extends Component
      constructor: (props) ->
        super props

        hocs = getHocs @props

        mergedHoc = _.flowRight hocs

        MergedWrappedComponent = mergedHoc WrappedComponent

        @state = observable
          mergedHoc: mergedHoc
          MergedWrappedComponent: MergedWrappedComponent

      componentWillUpdate: (nextProps) =>
        if not _.isEqual @props, nextProps
          hocs = getHocs nextProps

          mergedHoc = _.flowRight hocs

          if not _.isEqual mergedHoc, toJs @state.mergedHoc
            MergedWrappedComponent = mergedHoc WrappedComponent

            @state.MergedWrappedComponent = MergedWrappedComponent

      render: =>
        MergedWrappedComponent = toJs @state.MergedWrappedComponent

        <MergedWrappedComponent {...@props} />
