import OrdersView from './OrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'
import withProps from './withProps.coffee'

getOrdersSelector = (props) =>
  # status: props.ORDERS.STATUS.DISPATCHING.VALUE

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withLazyLoad(0)
    withConstant('orders')
    withFind('orders', getOrdersSelector)
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withProps
  ]

export default Orders = withHocs(getHocs) OrdersView
