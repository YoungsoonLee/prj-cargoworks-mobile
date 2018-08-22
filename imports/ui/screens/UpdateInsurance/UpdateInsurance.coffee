import UpdateInsuranceView from './UpdateInsuranceView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  userId: props.user._id

getDefaultState = (props) =>
  console.log props.transporter
  value:
    name: props.transporter.cargoInsuranceInsuredName
    idNumber: props.transporter.residentRegNumber

export default UpdateInsurance = withUser() withFindOne('transporters', getSelector) withState(getDefaultState) withValidation(['name', 'idNumber']) withHandler UpdateInsuranceView
