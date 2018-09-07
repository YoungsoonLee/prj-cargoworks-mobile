import PendingView from './PendingView.coffee'
import withHnadler from './withHnadler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

export default Pending = withUser() withFindOne('transporters', getSelector) withConstant('transporters') withHnadler PendingView
