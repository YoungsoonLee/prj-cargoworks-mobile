import { WebView } from 'react-native'

export default observer class TermView extends Component
  render: =>
    <Layout title="약관">
      <WebView source={{ html: @props.phrase.content }} originWhitelist={['*']} />
    </Layout>
