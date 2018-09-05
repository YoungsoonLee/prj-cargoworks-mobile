import UpdateInsuranceForOthersView from './UpdateInsuranceForOthersView.coffee'
import withHandler from './withHandler.coffee'
import withReaction from './withReaction.coffee'

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

getHocs = =>
  [
    withUser()
    withState(getDefaultState)
    withValidation(getItems)
    withReaction
    withHandler
  ]

export default UpdateInsuranceForOthers = withHocs(getHocs) UpdateInsuranceForOthersView
