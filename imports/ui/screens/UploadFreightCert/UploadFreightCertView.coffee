export default observer class UploadFreightCertView extends Component
  onChangeImageFrame: (url) =>
    @props.state.freightCertImageUrl = url

  onPressSave: =>
    @props.onPressSave()

  render: =>
    <Layout title="화물 인수증">
      <View style={{ height: 140, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
        <Text bold color={white} size={18}>화물 인수증을 업로드 합니다.</Text>
        <Text size={14} color="#fffae1">{ moment().format('YYYY.MM.DD a hh:mm') }</Text>
        <Text bold center color={white} marginTop={10}>운송사와 함께 확인할 수 있습니다.</Text>
      </View>
      <View style={{ padding: 10 }}>
        <ImageFrame aspectRatio={1.6} url={@props.state.freightCertImageUrl} onChange={@onChangeImageFrame} name="freightCertImageUrl" />
      </View>
      <View style={{ flex: 1, backgroundColor: darkBlue }} />
      { not not @props.state.freightCertImageUrl and
        <View style={{ alignItems: 'center', justifyContent: 'center', height: 55, backgroundColor: '#eeeeee' }}>
          <Text center color={black}>
            인수증을 다시 올리고 싶다면{'\n'}
            이미지를 삭제하고 다시 업로드 해주세요.
          </Text>
        </View>
        }
      <Button isDisabled={not @props.state.freightCertImageUrl} borderRadius={0} height={75} color="light blue" onPress={@onPressSave}>화물 인수증 저장하기</Button>
    </Layout>
