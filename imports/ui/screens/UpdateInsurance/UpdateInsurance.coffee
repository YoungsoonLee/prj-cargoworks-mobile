import UpdateInsuranceView from './UpdateInsuranceView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  userId: props.user._id

getDefaultState = (props) =>
  name: props.transporter.cargoInsuranceInsuredName
  idNumber: props.transporter.residentRegNumber
  isAgreeChecked: false

getItems = =>
  [
    path: 'name'
    isRequired: true
  ,
    path: 'idNumber'
    isRequired: true
  ,
    path: 'isAgreeChecked'
    validate: 'true'
  ]

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default UpdateInsurance = withHocs(getHocs) UpdateInsuranceView
