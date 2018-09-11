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

export default VerifyPhoneNumber = withState(getDefaultState, 'cState') withValidation(getItems) withHandler VerifyPhoneNumberView
