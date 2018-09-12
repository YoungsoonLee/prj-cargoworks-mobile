import OrdersView from './OrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'
import withProps from './withProps.coffee'

getOrdersSelector = (props) =>
  status: props.ORDERS.STATUS.DISPATCHING.VALUE

getOrdersOption = =>
  sort:
    createdAt: -1

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withLazyLoad(0)
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withConstant('orders')
    withFind('orders', getOrdersSelector, getOrdersOption)
    withProps
  ]

export default Orders = withHocs(getHocs) OrdersView
