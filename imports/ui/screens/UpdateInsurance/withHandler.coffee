export default withHandler = () =>
  observer class WithHandler extends Component
    render: =>
      <WrappedComponent {...@props} />
