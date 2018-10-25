export default withRouteParam = (WrappedComponent) =>
  observer class WithRouteParam extends Component
    render: =>
      routeParam = @props.navigation.state.params

      <WrappedComponent {...@props} routeParam={routeParam} />
