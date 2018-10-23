import BalancesView from './BalancesView.coffee'
import withProps from './withProps.coffee'
import withReaction from './withReaction.coffee'
import withHandler from './withHandler.coffee'

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = =>
  filter: '오늘'
  startAt: moment()
  endAt: moment()
  isOutstandingIncluded: false

getBalancesSelector = (props) =>
  transporterId: props.transporter._id

getBalancesOption = =>
  sort:
    createdAt: -1

getHocs = =>
  [
    withState(getDefaultState)
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withFind('balances', getBalancesSelector, getBalancesOption)
    withConstant('balances')
    withProps
    withReaction
    withHandler
  ]

export default Balances = withHocs(getHocs) BalancesView
