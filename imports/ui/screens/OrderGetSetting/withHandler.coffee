import deviceInfo from 'react-native-device-info'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSave: =>
      vehicles = @props.state.vehicles.map (vehicle) =>
        vehicleWeight = Util.getVehicleWeight vehicle, @props.TRANSPORTERS

        weight: vehicleWeight[1]
        boxType: vehicleWeight[0]

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
            'orderFilterConfigurations.$.vehicles': vehicles
            'orderFilterConfigurations.$.isOnlyMyAgentOrder': @props.state.isOnlyRecruitmentOrder
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
        orderFilterConfigurationsDefaultObject.vehicles = vehicles
        orderFilterConfigurationsDefaultObject.isOnlyMyAgentOrder = @props.state.isOnlyRecruitmentOrder

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
