import OrderDetailView from './OrderDetailView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id


getHocs = =>
  [
    withRouteParam
    withFindOne('orders', getSelector)
  ]

export default OrderDetail = withHocs(getHocs) OrderDetailView
