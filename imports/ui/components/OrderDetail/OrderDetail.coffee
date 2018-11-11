import OrderDetailView from './OrderDetailView.coffee'
import withHandler from './withHandler.coffee'
import withInterval from './withInterval.coffee'
import withReaction from './withReaction.coffee'

getSelector = (props) =>
  console.log 'OrderDetail props: ', props

  _id: props.user.profile.transporterId

getDefaultState = =>
  maxSecond: 20
  remainedSecond: 20

getHocs = =>
  [
    withState(getDefaultState)
    withUser()
    withFindOne('transporters', getSelector)
    withConstant('orders')
    withConstant('transporters')
    withHandler
    withInterval
    withReaction
  ]

export default OrderDetail = withHocs(getHocs) OrderDetailView
