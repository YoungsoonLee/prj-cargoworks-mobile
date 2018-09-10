export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSave: =>
      Meteor.call 'orders.update',
        _id: @props.order._id
      ,
        $set:
          'waypoints.proofOfDeliveryImageUrl': @props.state.freightCertImageUrl
          'waypoints.uploadedProofOfDeliveryAt': new Date()
          'waypoints.isUploadedProofOfDelivery': true
      , (error) =>
        if error
          Util.alert error.reason

          return

        Util.back()

        Util.alert '화물 인수증을 저장했습니다.'

    render: =>
      <WrappedComponent {...@props} onPressSave={@onPressSave} />
