import PublishCashReceiptView from './PublishCashReceiptView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = (props) =>
  method: props.order.method
  regNumber: if props.order.method is '사업자 번호' then props.order.publishNumber else ''
  phoneNumber: if props.order.method is '핸드폰 번호' then props.order.publishNumber else ''
  cardNumber: if props.order.method is '현금카드번호' then props.order.publishNumber else ''

getItems = (props) =>
  [
    path: 'method'
    isRequired: true
  ,
    path: 'regNumber'
    isRequired: props.state.method is '사업자 번호'
  ,
    path: 'phoneNumber'
    isRequired: props.state.method is '핸드폰 번호'
  ,
    path: 'cardNumber'
    isRequired: props.state.method is '현금카드번호'
  ]

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getOrdersSelector = (props) =>
  _id: props.routeParam.orderId

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withRouteParam
    withFindOne('orders', getOrdersSelector)
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default PublishCashReceipt = withHocs(getHocs) PublishCashReceiptView
