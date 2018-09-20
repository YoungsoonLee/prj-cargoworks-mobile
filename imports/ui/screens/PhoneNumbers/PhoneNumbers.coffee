import PhoneNumbersView from './PhoneNumbersView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = (props) =>
  phoneNumber: ''
  phoneNumbers: props.transporter.mobileNumbers

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withDefaultObject('mobileNumbers')
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withHandler
  ]

export default PhoneNumbers = withHocs(getHocs) PhoneNumbersView
