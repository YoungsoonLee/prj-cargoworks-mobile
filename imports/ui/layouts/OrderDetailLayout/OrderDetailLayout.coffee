import OrderDetailLayoutView from './OrderDetailLayoutView.coffee'
import withHandler from './withHandler.coffee'

getHocs = =>
  [
    withConstant('transporters')
    withConstant('orders')
    withHandler
  ]

export default OrderDetailLayout = withHocs(getHocs) OrderDetailLayoutView
