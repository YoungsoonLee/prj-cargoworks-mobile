import MainView from './MainView.coffee'

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getInvitationsSelector = (props) =>
  mobileNumbers = props.transporter.mobileNumbers.filter (mobileNumber) =>
    not mobileNumber.isTakenOverByOthers

  phoneNumbers = mobileNumbers.map (mobileNumber) =>
    mobileNumber.number

  mobileNumber:
    $in: phoneNumbers
  type: 'TRANSPORTER'
  status: 'INVITED'

option =
  isReadyNeeded: false
  isDocNeeded: false

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withFindOne('invitations', getInvitationsSelector, =>, option)
  ]

export default Main = withHocs(getHocs) MainView
