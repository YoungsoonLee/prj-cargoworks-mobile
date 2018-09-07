import OrderDetailView from './OrderDetailView.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withConstant('orders')
    withConstant('transporters')
  ]

export default OrderDetail = withHocs(getHocs) OrderDetailView
