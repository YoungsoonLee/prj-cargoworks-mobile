import FindIdView from './FindIdView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  name: ''
  phoneNumber: ''

getItems = =>
  [
    path: 'name'
    isRequired: true
  ,
    path: 'phoneNumber'
    validate: 'phone number'
    isRequired: true
  ]

getHocs = =>
  [
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default FindId = withHocs(getHocs) FindIdView
