import OrderDetailView from './OrderDetailView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withConstant('orders')
    withConstant('transporters')
    withHandler
  ]

export default OrderDetail = withHocs(getHocs) OrderDetailView
