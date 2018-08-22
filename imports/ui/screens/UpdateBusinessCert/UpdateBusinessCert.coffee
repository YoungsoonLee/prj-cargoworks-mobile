import UpdateBusinessCertView from './UpdateBusinessCertView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  value:
    regNumber: props.transporter.regNumber
    storeName: props.transporter.regName
    name: props.transporter.ownerName
    address: props.transporter.address
    contactNumber: props.transporter.phoneNumber
  isRegNumberValid: props.transporter.regNumber and true
  isRegNumberChecked: props.transporter.regNumber and true

export default UpdateBusinessCert = withUser() withFindOne('transporters', getSelector) withState(getDefaultState) withHandler UpdateBusinessCertView
