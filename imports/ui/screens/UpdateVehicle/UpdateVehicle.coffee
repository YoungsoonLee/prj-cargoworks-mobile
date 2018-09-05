import UpdateVehicleView from './UpdateVehicleView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  userId: props.user._id

getDefaultState = (props) =>
  carNumber: props.transporter.vehiclePlateNumbers
  isSelectVehiclePopupVisible: false
  weight: props.transporter.vehicleWeightCapacity
  boxType: props.transporter.freightBoxType
  vehicle: Util.getVehicle props.transporter.vehicleWeightCapacity, props.transporter.freightBoxType, props.TRANSPORTERS
  carRegisterImageUrl: props.transporter.vehicleRegistrationImageUrl

getItems = =>
  [
    path: 'carNumber'
    isRequired: true
  ,
    path: 'vehicle'
    isRequired: true
  ,
    path: 'carRegisterImageUrl'
    isRequired: true
  ]

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withConstant('transporters')
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default UpdateVehicle = withHocs(getHocs) UpdateVehicleView
