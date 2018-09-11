import UpdateVehicleView from './UpdateVehicleView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  userId: props.user._id

getDefaultState = (props) =>
  carNumber: props.transporter.vehiclePlateNumbers
  isSelectVehiclePopupVisible: false
  weight: props.transporter.vehicleWeightCapacity
  boxType: props.transporter.freightBoxType
  # Util.getVehicle 함수는 db scheme의 값을 받아서 ui component에서 사용하는 vehicle string으로 변환해준다
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
