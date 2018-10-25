export default withConnection = (WrappedComponent) =>
  observer class WithConnection extends Component
    # @propTypes:
    #   isUserReady: PropTypes.bool

    @defaultProps:
      isUserReady: false

    render: =>
      <WrappedComponent {...@props} isConnected={@props.isUserReady} />

  withTracker(=>
    isUserReady: not Meteor.loggingIn()
  ) WithConnection
