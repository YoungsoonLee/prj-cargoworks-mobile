export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      Util.go 'Terms'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
