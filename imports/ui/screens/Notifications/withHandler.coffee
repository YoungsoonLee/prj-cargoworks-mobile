export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNotification: (notification) =>
      

    render: =>
      <WrappedComponent {...@props} onPressNotification={@onPressNotification} />
