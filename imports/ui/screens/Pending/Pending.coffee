import PendingView from './PendingView.coffee'
import withHnadler from './withHnadler.coffee'
import withProps from './withProps.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withConstant('transporters')
    withHnadler
    withProps
  ]

export default Pending = withHocs(getHocs) PendingView
