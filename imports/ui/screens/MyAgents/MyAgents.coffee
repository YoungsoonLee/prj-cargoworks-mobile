import MyAgentsView from './MyAgentsView.coffee'
import withHandler from './withHandler.coffee'
import withProps from './withProps.coffee'

getInvitationsSelector = (props) =>
  mobileNumbers = props.transporter.mobileNumbers.filter (mobileNumber) =>
    not mobileNumber.isTakenOverByOthers

  phoneNumbers = mobileNumbers.map (mobileNumber) =>
    mobileNumber.number

  mobileNumber:
    $in: phoneNumbers
  type: 'TRANSPORTER'
  status: 'INVITED'

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getFindOneAgentsSelector = (props) =>
  _id: props.transporter.agentId

getFindAgentsSelector = (props) =>
  agentIds = props.invitations.map (invitation) =>
    invitation.inviterPersonnel.agentId

  _id:
    $in: agentIds

option =
  isDocNeeded: false

getDefaultState = (props) =>
  checkedMyAgent =
    type: if props.transporter.agentId then 'agent' else 'indivisual'
    id: props.transporter.agentId or 'indivisual'
    title: if props.transporter.agentId then props.agent.name else '개인 기사로 활동'

  checkedMyAgent: checkedMyAgent

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withFindOne('agents', getFindOneAgentsSelector, =>, option)
    withFind('invitations', getInvitationsSelector)
    withFind('agents', getFindAgentsSelector)
    withState(getDefaultState)
    withProps
    withHandler
  ]

export default MyAgents = withHocs(getHocs) MyAgentsView
