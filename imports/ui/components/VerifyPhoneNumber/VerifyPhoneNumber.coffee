import VerifyPhoneNumberView from './VerifyPhoneNumberView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  phoneNumber: ''
  secretNumber: ''
  internalSecretNumber: ''
  isSecretNumberValid: false
  secretNumberError: ''

getItems = =>
  [
    path: 'phoneNumber'
    validate: 'phone number'
    isRequired: true
  ]

getHocs = =>
  [
    withState(getDefaultState, 'cState')
    withValidation(getItems)
    withHandler
  ]

export default VerifyPhoneNumber = withHocs(getHocs) VerifyPhoneNumberView
