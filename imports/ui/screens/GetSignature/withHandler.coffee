export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onSave: (result) =>
      Meteor.call 'uploadImage', result.encoded, (error, url) =>
        if error
          Util.alert error.reason

          return

        modifier =
          $set:
            "waypoints.addresses.#{@props.routeParam.addressIndex}.signatureImageUrl": url
            "waypoints.addresses.#{@props.routeParam.addressIndex}.isSignedOff": true
            "waypoints.addresses.#{@props.routeParam.addressIndex}.signedOffAt": new Date()
            "waypoints.addresses.#{@props.routeParam.addressIndex}.isActive": false

        console.log '@props.routeParam: ', @props.routeParam
        if @props.routeParam.addressIndex is 0
          _.extend modifier.$set,
            "waypoints.pickedUpAt": new Date()
            status: @props.ORDERS.STATUS.DELIVERYING.VALUE

          Meteor.call 'transporters.update',
            _id: @props.routeParam.transporterId
          , $set:
            operationStatus: @props.TRANSPORTERS.OPERATION_STATUS.DELIVERYING.VALUE
          , (error, result) =>
            if error
              Util.alert error.reason
              return

        if not @props.routeParam.isLastAddress
          _.extend modifier.$set,
            "waypoints.addresses.#{@props.routeParam.addressIndex + 1}.isActive": true

        Meteor.call 'orders.update',
          _id: @props.routeParam.orderId
        , modifier, (error) =>
          if error
            Util.alert error.reason

            return

          if not @props.routeParam.isLastAddress
            Util.back()

            Util.alert '서명을 저장했습니다.'

          else
            Meteor.call 'orders.update.transporter.delivery.complete', @props.routeParam.orderId, @props.routeParam.transporterId, (error) =>
              if error
                Util.alert error.reason

                return

              Util.back()

              Util.alert '배송이 완료되었습니다.'

    render: =>
      <WrappedComponent {...@props} onSave={@onSave} />
