import { Linking } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressGetSignature: =>
      index = @props.order.waypoints.addresses.findIndex (address) =>
        address.isActive

      if index is @props.order.waypoints.addresses.length - 1
        isLastAddress = true

      else
        isLastAddress = false

      Util.go 'GetSignature',
        orderId: @props.order._id
        transporterId: @props.transporter._id
        addressIndex: index
        isLastAddress: isLastAddress

    onPressPhone: (phoneNumber) =>
      Util.confirm "#{phoneNumber}로 전화 하시겠습니까?", =>
        Linking.openURL "tel:#{phoneNumber}"

    render: =>
      <WrappedComponent {...@props} onPressGetSignature={@onPressGetSignature} onPressPhone={@onPressPhone} />
