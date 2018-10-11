import OrderDetailLayoutView from './OrderDetailLayoutView.coffee'

getHocs = =>
  [
    withConstant('transporters')
    withConstant('orders')
  ]

export default OrderDetailLayout = withHocs(getHocs) OrderDetailLayoutView
