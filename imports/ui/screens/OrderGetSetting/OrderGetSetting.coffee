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
  _vehicles = orderFilterConfiguration.vehicles.map (vehicle) =>
    Util.getVehicleFromConstant vehicle, props.RECRUITMENTS

  distance: orderFilterConfiguration.distance
  vehicles: _vehicles
  isOnlyMyAgentOrder: orderFilterConfiguration.isOnlyMyAgentOrder

getHocs = =>
  [
    withConstant('recruitments')
    withDefaultObject('orderFilterConfigurations')
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withHandler
  ]

export default OrderGetSetting = withHocs(getHocs) OrderGetSettingView
