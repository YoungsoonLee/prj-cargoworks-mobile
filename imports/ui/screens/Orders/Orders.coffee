import OrdersView from './OrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'
import withProps from './withProps.coffee'

getSelector = (props) =>
  # status: props.ORDERS.STATUS.DISPATCHING.VALUE

getHocs = =>
  [
    withLazyLoad(0)
    withConstant('orders')
    withFind('orders', getSelector)
    withConstant('transporters')
    withProps
  ]

export default Orders = withHocs(getHocs) OrdersView
