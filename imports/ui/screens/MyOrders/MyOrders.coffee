import MyOrdersView from './MyOrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'
import withProps from './withProps.coffee'

getOrdersSelector = (props) =>
  'transporter._id': props.transporter._id

getOrdersOption = =>
  $sort:
    createdAt: -1

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withLazyLoad(0)
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withConstant('orders')
    withFind('orders', getOrdersSelector, getOrdersOption)
    withConstant('transporters')
    withProps
  ]

export default MyOrders = withLazyLoad(1) withHocs(getHocs) MyOrdersView
