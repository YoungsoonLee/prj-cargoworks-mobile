export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressMyAgent: (recruitment) =>
      Util.go 'MyAgentDetail',
        recruitmentId: recruitment._id

    render: =>
      <WrappedComponent {...@props} onPressMyAgent={@onPressMyAgent} />
