import OrdersByAddress2View from './OrdersByAddress2View.coffee'
import withProps from './withProps.coffee'

getSelector = (props) =>
  status: props.ORDERS.STATUS.DISPATCHING.VALUE

getHocs = =>
  [
    withRouteParam
    withConstant('orders')
    withFind('orders', getSelector)
    withProps
  ]

export default OrdersByAddress2 = withHocs(getHocs) OrdersByAddress2View
