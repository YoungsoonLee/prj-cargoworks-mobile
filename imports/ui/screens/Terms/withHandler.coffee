export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressTerm: (name) =>
      Util.go 'Term',
        name: name

    onPressNext: =>
      Util.go 'Signup'

    render: =>
      <WrappedComponent {...@props} onPressTerm={@onPressTerm} onPressNext={@onPressNext} />
