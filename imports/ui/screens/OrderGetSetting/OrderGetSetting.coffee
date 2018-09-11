import OrderGetSettingView from './OrderGetSettingView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  vehicleTypes = props.transporter.orderFilterConfigurations.vehicleTypes

  vehicles = vehicleTypes.map (vehicleType) =>
    vehicle = Util.getVehicle vehicleType.weight, vehicleType.boxType, props.TRANSPORTER

    vehicle

  distance: '설정안함'
  vehicles: vehicles

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
