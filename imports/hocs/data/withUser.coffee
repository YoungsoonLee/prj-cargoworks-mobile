export default withUser = (isLoginRequired = true, isReadyNeeded = true) =>
  (WrappedComponent) =>
    observer class WithUser extends Component
      # @propTypes:
      #   isUserReady: PropTypes.bool
      #   user: PropTypes.object

      @defaultProps:
        isUserReady: false
        user: {}

      render: =>
        if isReadyNeeded and not @props.isUserReady
          return null

        if isLoginRequired and not @props.user._id
          return null

        <WrappedComponent {...@props} user={@props.user} />

    withTracker(=>
      isUserReady: !Meteor.loggingIn()
      user: Meteor.user() or {}
    ) WithUser
