import BalanceView from './BalanceView.coffee'
import withProps from './withProps.coffee'
import withMeta from './withMeta.coffee'
import withHandler from './withHandler.coffee'

getBalancesSelector = (props) =>
  _id: props.routeParam.id

getAgentsSelector = (props) =>
  _id: props.balance.agentId

option =
  isDocNeeded: false

getOrdersSelector = (props) =>
  props.balance.orderId

getHocs = =>
  [
    withConstant('balances')
    withRouteParam
    withFindOne('balances', getBalancesSelector)
    withFindOne('agents', getAgentsSelector, =>, option)
    withFindOne('orders', getOrdersSelector, =>, option)
    withProps
    withMeta
    withHandler
  ]

export default Balance = withHocs(getHocs) BalanceView
