import FindPasswordView from './FindPasswordView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  id: ''
  name: ''
  phoneNumber: ''

getItems = =>
  [
    path: 'id'
    isRequired: true
  ,
    path: 'name'
    isRequired: true
  ,
    path: 'phoneNumber'
    validate: 'phone number'
    isRequired: true
  ]

getSelector: (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default FindPassword = withHocs(getHocs) FindPasswordView
