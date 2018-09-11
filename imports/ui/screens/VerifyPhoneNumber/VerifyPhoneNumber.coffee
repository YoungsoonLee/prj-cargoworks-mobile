import VerifyPhoneNumberView from './VerifyPhoneNumberView.coffee'
import withHandler from './withHandler.coffee'
import withReaction from './withReaction.coffee'

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
    withReaction
    withHandler
  ]

export default VerifyPhoneNumber = withHocs(getHocs) VerifyPhoneNumberView
