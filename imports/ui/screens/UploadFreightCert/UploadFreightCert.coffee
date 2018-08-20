export default observer class UploadFreightCert extends Component
  constructor: (props) ->
    super props

    @state = observable
      freightCertImageUrl: ''

  onChangeImageFrame: (url) =>
    @state.freightCertImageUrl = url

  onPressSave: =>
    console.log @state.freightCertImageUrl

    # TODO: david. 화물 인수증 이미지 url을 처리하는 로직을 이곳에 적으면 됩니다.

    Util.back()

    Util.alert '화물 인수증을 저장했습니다.'

  render: =>
    <Layout title="화물 인수증">
      <View style={{ height: 140, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
        <Text bold color={white} size={18}>화물 인수증을 업로드 합니다.</Text>
        <Text size={14} color="#fffae1">2018.07.30 오후 03:20</Text>
        <Text bold center color={white} marginTop={10}>운송사와 함께 확인할 수 있습니다.</Text>
      </View>
      <View style={{ padding: 10 }}>
        <ImageFrame aspectRatio={1.6} url={@state.freightCertImageUrl} onChange={@onChangeImageFrame} name="freightCertImageUrl" />
      </View>
      <View style={{ flex: 1, backgroundColor: darkBlue }} />
      { not not @state.freightCertImageUrl and
        <View style={{ alignItems: 'center', justifyContent: 'center', height: 55, backgroundColor: '#eeeeee' }}>
          <Text center color={black}>
            인수증을 다시 올리고 싶다면{'\n'}
            이미지를 삭제하고 다시 업로드 해주세요.
          </Text>
        </View>
        }
      <Button isDisabled={not @state.freightCertImageUrl} borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>화물 인수증 저장하기</Button>
    </Layout>
