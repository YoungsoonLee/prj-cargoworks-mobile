import OrderGetSettingView from './OrderGetSettingView.coffee'
import withHandler from './withHandler.coffee'
import deviceInfo from 'react-native-device-info'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  deviceId =  deviceInfo.getUniqueID()

  _orderFilterConfiguration = props.transporter.orderFilterConfigurations.find (orderFilterConfiguration) =>
    orderFilterConfiguration.deviceId is deviceId

  if _orderFilterConfiguration
    orderFilterConfiguration = _orderFilterConfiguration

  else
    orderFilterConfigurationsDefaultObject = _.cloneDeep props.orderFilterConfigurationsDefaultObject

    orderFilterConfiguration = orderFilterConfigurationsDefaultObject

  # Util.getVehicleFromConstant은 constant의 value를 ui에서 쓰는 value로 바꿔준다.
  vehicles = orderFilterConfiguration.vehicles.map (vehicle) =>
    Util.getVehicle vehicle.weight, vehicle.boxType, props.TRANSPORTERS

  distance: orderFilterConfiguration.distance
  vehicles: vehicles
  isOnlyMyAgentOrder: orderFilterConfiguration.isOnlyMyAgentOrder

getHocs = =>
  [
    withDefaultObject('orderFilterConfigurations')
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withHandler
  ]

export default OrderGetSetting = withHocs(getHocs) OrderGetSettingView
