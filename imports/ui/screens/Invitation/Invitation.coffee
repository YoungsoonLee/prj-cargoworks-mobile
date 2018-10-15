import InvitationView from './InvitationView.coffee'
import withHandler from './withHandler.coffee'

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getInvitationsSelector = (props) =>
  _id: props.routeParam.id

getAgentsSelector = (props) =>
  _id: props.invitation.inviterPersonnel.agentId

getHocs = =>
  [
    withRouteParam
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withFindOne('invitations', getInvitationsSelector)
    withFindOne('agents', getAgentsSelector)
    withHandler
  ]

export default Invitation = withHocs(getHocs) InvitationView
