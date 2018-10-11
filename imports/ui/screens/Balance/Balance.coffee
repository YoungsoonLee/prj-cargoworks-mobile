import BalanceView from './BalanceView.coffee'

getHocs = =>
  [
    withRouteParam
  ]

export default Balance = withHocs(getHocs) BalanceView
