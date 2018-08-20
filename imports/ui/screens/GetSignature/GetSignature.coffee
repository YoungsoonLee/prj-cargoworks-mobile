import SignatureCapture from 'react-native-signature-capture'

export default observer class GetSignature extends Component
  onPressSave: =>
    @signatureCaptureRef.saveImage()

  onSave: (result) =>
    Meteor.call 'uploadImage', result.encoded, (error, url) =>
      if error
        Util.alert error.reason

        return

      console.log url

      # TODO: david. 서명 url을 way point에 저장하는 로직을 여기에 작성.

      Util.back()

      Util.alert '서명을 저장했습니다.'

  render: =>
    <Layout title="서명">
      <View style={{ height: 140, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
        <Text bold color={white} size={18}>픽업지 서명</Text>
        <Text size={14} color="#fffae1">2018.07.30 오후 03:20</Text>
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
