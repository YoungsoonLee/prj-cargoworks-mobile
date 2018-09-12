import GetSignatureView from './GetSignatureView.coffee'
import withHandler from './withHandler.coffee'

getHocs = (props) =>
  [
    withRouteParam
    withConstant('orders')
    withHandler
  ]

export default GetSignature = withHocs(getHocs) GetSignatureView
