import MyOrderDetailView from './MyOrderDetailView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id

export default MyOrderDetail = withRouteParam withFindOne('orders', getSelector) MyOrderDetailView
