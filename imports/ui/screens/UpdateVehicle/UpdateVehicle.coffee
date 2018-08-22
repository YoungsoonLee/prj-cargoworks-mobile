import UpdateVehicleView from './UpdateVehicleView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  userId: props.user._id

getDefaultState = (props) =>
  value:
    carNumber: props.transporter.vehiclePlateNumbers
    weight: props.transporter.vehicleWeightCapacity
    boxType: props.transporter.freightBoxType
    carRegisterImageUrl: props.transporter.vehicleRegistrationImageUrl

export default UpdateVehicle = withUser() withFindOne('transporters', getSelector) withConstant('transporters') withState(getDefaultState) withHandler UpdateVehicleView
