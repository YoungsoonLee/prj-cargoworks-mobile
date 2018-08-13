import OrderDetailView from './OrderDetailView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id

export default OrderDetail = withRouteParam withFindOne('orders', getSelector) OrderDetailView
