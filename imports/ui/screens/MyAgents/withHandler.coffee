export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSave: =>


    render: =>
      <WrappedComponent {...@props} onPressSave={@onPressSave} />
