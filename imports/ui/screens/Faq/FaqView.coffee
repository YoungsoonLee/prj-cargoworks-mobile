export default observer class FaqView extends Component
  render: =>
    <Layout title="자주 묻는 질문">
      <ScrollView style={{ padding: 20 }}>
        <Text size={18} bold marginLeft={5}>{ @props.faq.title }</Text>
        <Text size={14} color="#666666" marginTop={20}>{ @props.faq.content }</Text>
      </ScrollView>
    </Layout>
