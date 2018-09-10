import UploadFreightCertView from './UploadFreightCertView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = (props) =>
  freightCertImageUrl: props.order.waypoints.proofOfDeliveryImageUrl

getSelector = (props) =>
  _id: props.routeParam.orderId

getHocs = =>
  [
    withRouteParam
    withFindOne('orders', getSelector)
    withState(getDefaultState)
    withHandler
  ]

export default UploadFreightCert = withHocs(getHocs) UploadFreightCertView
