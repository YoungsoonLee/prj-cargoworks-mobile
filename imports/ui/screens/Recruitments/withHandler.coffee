export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressRecruitment: (recruitment) =>
      Util.go 'RecruitmentDetail',
        recruitmentId: recruitment._id

    render: =>
      <WrappedComponent {...@props} onPressRecruitment={@onPressRecruitment} />
