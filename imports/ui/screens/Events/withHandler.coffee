export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressEvent: (event) =>
      Util.go 'Event',
        id: event._id

    render: =>
      <WrappedComponent {...@props} onPressEvent={@onPressEvent} />
