import UpdateInsuranceForOthersView from './UpdateInsuranceForOthersView.coffee'
import withHandler from './withHandler.coffee'
import withReaction from './withReaction.coffee'
import withProps from './withProps.coffee'

getDefaultState = =>
  name: ''
  idNumber: ''
  isAgreeChecked: false
  isAlreadyRegistered: true

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
