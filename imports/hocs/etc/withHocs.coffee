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
        hocs = getHocs nextProps

        mergedHoc = _.flowRight hocs

        if JSON.stringify(mergedHoc) isnt JSON.stringify(toJs(@state.mergedHoc))
          MergedWrappedComponent = mergedHoc WrappedComponent

          @state.MergedWrappedComponent = MergedWrappedComponent

      render: =>
        MergedWrappedComponent = toJs @state.MergedWrappedComponent

        <MergedWrappedComponent {...@props} />
