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

getOrdersSelector = (props) =>
  status: 'DISPATCHING'
  dispatchType: 'DESIGNATED'
  'transporter._id': props.transporter._id

getOrdersOption = =>
  sort:
    createdAt: -1

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withFindOne('invitations', getInvitationsSelector, =>, option)
    withFindOne('orders', getOrdersSelector, getOrdersOption, option)
  ]

export default Main = withHocs(getHocs) MainView
