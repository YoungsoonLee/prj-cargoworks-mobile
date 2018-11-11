import GetSignatureView from './GetSignatureView.coffee'
import withHandler from './withHandler.coffee'

getHocs = (props) =>
  console.log 'GetSignature props: ', props
  [
    withRouteParam
    withConstant('orders')
    withConstant('transporters')
    withHandler
  ]

export default GetSignature = withHocs(getHocs) GetSignatureView
