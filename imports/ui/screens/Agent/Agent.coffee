export default observer class Agent extends Component
  renderInfos: =>
    infos = [
      label: '운송 주선'
      content: '빠르다 로지스'
    ,
      label: '사업자'
      content: '00-0000-0000'
    ,
      label: '대표자명'
      content: '홍길동'
    ,
      label: '사업장'
      content: '서울시 강남구 신사동 520-5'
    ,
      label: '대표번호'
      content: '02-0000-0000'
    ,
      label: '이메일'
      content: 'asdf@asdf.com'
    ]

    infos.map (info, index) =>
      <View key={index} style={{ flexDirection: 'row', height: 35 }}>
        <View style={{ width: 100, borderRightWidth: 1, borderRightColor: '#a2aabf', paddingLeft: 10, justifyContent: 'center' }}>
          <Text color={black} size={17} bold>{ info.label }</Text>
        </View>
        <View style={{ flex: 1, paddingLeft: 10, justifyContent: 'center' }}>
          <Text color={black} size={17} bold>{ info.content }</Text>
        </View>
      </View>

  render: =>
    <Layout title="운송주선사 정보">
      <View style={{ flex: 1, backgroundColor: darkBlue }}>
        <View style={{ backgroundColor: white }}>
          { @renderInfos() }
        </View>
      </View>
    </Layout>
