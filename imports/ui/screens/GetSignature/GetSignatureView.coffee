import SignatureCapture from 'react-native-signature-capture'

export default observer class GetSignatureView extends Component
  onPressSave: =>
    @signatureCaptureRef.saveImage()

  onSave: (result) =>
    Meteor.call 'uploadImage', result.encoded, (error, url) =>
      if error
        Util.alert error.reason

        return

      modifier =
        $set:
          "waypoints.addresses.#{@props.routeParam.addressIndex}.signatureImageUrl": url
          "waypoints.addresses.#{@props.routeParam.addressIndex}.isSignedOff": true
          "waypoints.addresses.#{@props.routeParam.addressIndex}.signedOffAt": new Date()
          "waypoints.addresses.#{@props.routeParam.addressIndex}.isActive": false

      if not @props.routeParam.isLastAddress
        _.extend modifier.$set,
          "waypoints.addresses.#{@props.routeParam.addressIndex + 1}.isActive": true

      else
        _.extend modifier.$set,
          'waypoints.dischargedAt': new Date()
          status: @props.ORDERS.STATUS.COMPLETED.VALUE

      Meteor.call 'orders.update',
        _id: @props.routeParam.orderId
      , modifier, (error) =>
        if error
          Util.alert error.reason

          return

        Util.back()

        Util.alert '서명을 저장했습니다.'

  render: =>
    <Layout title="서명">
      <View style={{ height: 140, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
        <Text bold color={white} size={18}>픽업지 서명</Text>
        <Text marginTop={5} size={14} color="#fffae1">{ moment().format('YYYY.MM.DD a hh:mm') }</Text>
        <Text bold center color={white} marginTop={10}>
          고객님 성함으로 서명을 받으세요.{'\n'}
          허위로 완료 처리시 앱 사용에 제한이 있을 수 있습니다.
        </Text>
      </View>
      <SignatureCapture onSaveEvent={@onSave} ref={(ref) => @signatureCaptureRef = ref } style={{ height: width / 1.6 }} showNativeButtons={false} showTitleLabel={false} />
      <View style={{ flex: 1, backgroundColor: darkBlue }} />
      <View style={{ alignItems: 'center', justifyContent: 'center', height: 55, backgroundColor: '#eeeeee' }}>
        <Text color={black}>서명을 저장하면 수정불가 / 보기만 가능합니다.</Text>
      </View>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>
        <View style={{ flexDirection: 'row' }}>
          <Image source={require '../../../../images/pencil.png'} style={{ width: 18, height: 18 }} />
          <Text bold marginLeft={5} color={white} size={20}>서명저장</Text>
        </View>
      </Button>
    </Layout>
