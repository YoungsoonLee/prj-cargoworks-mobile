import Htmlview from 'react-native-htmlview'

export default observer class TermView extends Component
  render: =>
    <Layout title="약관">
      <ScrollView style={{ padding: 16 }}>
        <Htmlview value={@props.phrase.content} />
      </ScrollView>
    </Layout>
