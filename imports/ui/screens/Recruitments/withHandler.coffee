export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressRecruitment: (recruitment) =>
      Util.go 'Recruitment',
        recruitment: recruitment

    render: =>
      <WrappedComponent {...@props} onPressRecruitment={@onPressRecruitment} />
