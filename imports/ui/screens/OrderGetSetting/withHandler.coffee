import deviceInfo from 'react-native-device-info'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSave: =>
      vehicleConstatns = @props.state.vehicles.map (vehicle) =>
        Util.getVehicleConstantFromVehicle vehicle, @props.RECRUITMENTS

      deviceId =  deviceInfo.getUniqueID()

      _orderFilterConfiguration = @props.transporter.orderFilterConfigurations.find (orderFilterConfiguration) =>
        orderFilterConfiguration.deviceId is deviceId

      if _orderFilterConfiguration
        Meteor.call 'transporters.update',
          _id: @props.transporter._id
          'orderFilterConfigurations.deviceId': deviceId
        ,
          $set:
            'orderFilterConfigurations.$.distance': @props.state.distance
            'orderFilterConfigurations.$.vehicles': vehicleConstatns
            'orderFilterConfigurations.$.isOnlyMyAgentOrder': @props.state.isOnlyMyAgentOrder
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.back()

          Util.alert '저장되었습니다.'

      else
        orderFilterConfigurationsDefaultObject = _.cloneDeep @props.orderFilterConfigurationsDefaultObject

        orderFilterConfigurationsDefaultObject.deviceId = deviceInfo.getUniqueID()

        orderFilterConfigurationsDefaultObject.distance = @props.state.distance
        orderFilterConfigurationsDefaultObject.vehicles = vehicleConstatns
        orderFilterConfigurationsDefaultObject.isOnlyMyAgentOrder = @props.state.isOnlyMyAgentOrder

        Meteor.call 'transporters.update',
          _id: @props.transporter._id
        ,
          $push:
            orderFilterConfigurations: orderFilterConfigurationsDefaultObject
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.back()

          Util.alert '저장되었습니다.'

    render: =>
      <WrappedComponent {...@props} onPressSave={@onPressSave} />
