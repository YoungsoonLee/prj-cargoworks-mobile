export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressFaq: (faqId) =>
      Util.go 'Faq',
        id: faqId

    render: =>
      <WrappedComponent {...@props} onPressFaq={@onPressFaq} />
