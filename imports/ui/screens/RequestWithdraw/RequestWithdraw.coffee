import RequestWithdrawView from './RequestWithdrawView.coffee'
import withProps from './withProps.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withFindOne('globals')
    withConstant('accounts')
    withUser()
    withFindOne('transporters', getSelector)
    withProps
  ]

export default RequestWithdraw = withHocs(getHocs) RequestWithdrawView
