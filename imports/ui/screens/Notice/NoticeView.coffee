export default observer class NoticeView extends Component
  render: =>
    <Layout title="공지사항">
      <ScrollView style={{ padding: 20 }}>
        <Text size={14} color="#666666" marginLeft={5}>{ moment(@props.notice.createdAt).format('YYYY.MM.DD') }</Text>
        <Text size={18} marginTop={3} bold marginLeft={5}>{ @props.notice.title }</Text>
        <Text size={14} color="#666666" marginTop={20}>{ @props.notice.content }</Text>
      </ScrollView>
    </Layout>
