import BalancesView from './BalancesView.coffee'
import withProps from './withProps.coffee'
import withReaction from './withReaction.coffee'

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = =>
  filter: '오늘'
  startAt: moment()
  endAt: moment()

getBalancesSelector = (props) =>
  transporterId: props.transporter._id

getHocs = =>
  [
    withState(getDefaultState)
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withFind('balances', getBalancesSelector)
    withConstant('balances')
    withProps
    withReaction
  ]

export default Balances = withHocs(getHocs) BalancesView
