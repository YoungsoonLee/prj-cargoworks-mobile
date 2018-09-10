import GetSignatureView from './GetSignatureView.coffee'

getHocs = (props) =>
  [
    withRouteParam
    withConstant('orders')
  ]

export default GetSignature = withHocs(getHocs) GetSignatureView
