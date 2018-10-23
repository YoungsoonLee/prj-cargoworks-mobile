import UpdateInsuranceForOthersView from './UpdateInsuranceForOthersView.coffee'
import withHandler from './withHandler.coffee'
import withReaction from './withReaction.coffee'
import withProps from './withProps.coffee'

getDefaultState = (props) =>
  name: props.transporter.cargoInsuranceInsuredName
  idNumber: props.transporter.residentRegNumber
  isAgreeChecked: props.transporter.hasAgreedForCargoInsurance
  isAlreadyRegistered: not props.transporter.hasAgreedForCargoInsurance

getItems = =>
  [
    path: 'name'
    isRequired: true
  ,
    path: 'idNumber'
    isRequired: true
  ]

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withRouteParam
    withFindOne('insurances')
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withValidation(getItems)
    withConstant('transporters')
    withReaction
    withProps
    withHandler
  ]

export default UpdateInsuranceForOthers = withHocs(getHocs) UpdateInsuranceForOthersView
