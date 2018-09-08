import MyOrderDetailView from './MyOrderDetailView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id

getHocs = =>
  [
    withRouteParam
    withFindOne('orders', getSelector)
    withConstant('orders')
  ]

export default MyOrderDetail = withHocs(getHocs) MyOrderDetailView
