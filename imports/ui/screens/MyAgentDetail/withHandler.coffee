export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressApply: =>
      

    render: =>
      <WrappedComponent {...@props} onPressApply={@onPressApply} />
