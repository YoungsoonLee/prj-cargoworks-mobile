import Htmlview from 'react-native-htmlview'

export default observer class UsageView extends Component
  render: =>
    <Layout title="카고웍스 사용방법 안내">
      <ScrollView style={{ padding: 16 }}>
        <Htmlview value={@props.phrase.content} />
      </ScrollView>
    </Layout>
