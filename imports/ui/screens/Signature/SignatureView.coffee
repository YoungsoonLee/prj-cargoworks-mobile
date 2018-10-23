import SignatureCapture from 'react-native-signature-capture'

export default observer class SignatureView extends Component
  render: =>
    <Layout title="서명">
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center', backgroundColor: darkBlue, borderTopWidth: 1, borderTopColor: '#a2aabf' }}>
        <Text bold color={white} size={18}>서명일시</Text>
        <Text marginTop={5} size={14} color="#fffae1">{ moment(@props.routeParam.signedOffAt).format('YYYY.MM.DD a hh:mm') }</Text>
      </View>
      <Image source={{ uri: @props.routeParam.signatureImageUrl }} style={{ width: width, height: width / 1.6 }} />
      <View style={{ flex: 1, backgroundColor: darkBlue }} />
    </Layout>
