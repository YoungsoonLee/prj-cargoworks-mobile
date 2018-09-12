import { Linking } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressPhone: (phoneNumber) =>
      Util.confirm "#{phoneNumber}로 전화 하시겠습니까?", =>
        Linking.openURL "tel:#{phoneNumber}"

    onPressSignature: (signatureImageUrl, signedOffAt) =>
      Util.go 'Signature',
        signatureImageUrl: signatureImageUrl
        signedOffAt: signedOffAt

    render: =>
      <WrappedComponent {...@props} onPressPhone={@onPressPhone} onPressSignature={@onPressSignature} />
