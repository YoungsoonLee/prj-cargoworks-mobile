import Htmlview from 'react-native-htmlview'

export default observer class TermView extends Component
  render: =>
    <Layout title="약관">
      <ScrollView>
        <Htmlview value={@props.phrase.content} />
      </ScrollView>
    </Layout>
