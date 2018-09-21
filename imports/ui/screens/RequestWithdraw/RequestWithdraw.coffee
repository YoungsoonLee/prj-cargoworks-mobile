import RequestWithdrawView from './RequestWithdrawView.coffee'
import withProps from './withProps.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = =>
  amount: ''

getItems = (props) =>
  [
    path: 'amount'
    validate: (value) =>
      amount = parseInt(value) or 0

      if amount < 1
        return false

      if amount > props.availableWithdraw
        return false

      true
    getError: (value) =>
      amount = parseInt(value) or 0

      if amount < 1
        return '최소 1원 이상의 금액을 요청해야 합니다.'

      if amount > props.availableWithdraw
        return '환급 가능 금액보다 많습니다.'

      ''
    isRequired: true
  ]

getHocs = =>
  [
    withFindOne('globals')
    withConstant('accounts')
    withUser()
    withFindOne('transporters', getSelector)
    withProps
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default RequestWithdraw = withHocs(getHocs) RequestWithdrawView
