export default withLazyLoad = (index) =>
  (WrappedComponent) =>
    observer class WithLazyLoad extends Component
      render: =>
        if not state.lazyLoadFlags[index]
          return null

        <WrappedComponent {...@props} />
