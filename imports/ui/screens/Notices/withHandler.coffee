export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNotice: (noticeId) =>
      Util.go 'Notice',
        id: noticeId

    render: =>
      <WrappedComponent {...@props} onPressNotice={@onPressNotice} />
