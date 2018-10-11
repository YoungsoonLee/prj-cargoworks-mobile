import OrdersByAddressView from './OrdersByAddressView.coffee'
import withProps from './withProps.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  status: props.ORDERS.STATUS.DISPATCHING.VALUE

getHocs = =>
  [
    withRouteParam
    withConstant('orders')
    withFind('orders', getSelector)
    withProps
    withHandler
  ]

export default OrdersByAddress = withHocs(getHocs) OrdersByAddressView
