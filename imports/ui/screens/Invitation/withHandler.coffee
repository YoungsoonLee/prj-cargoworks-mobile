export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    render: =>
      <WrappedComponent {...@props}  />
