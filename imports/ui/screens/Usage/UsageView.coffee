import { WebView } from 'react-native'

export default observer class UsageView extends Component
  render: =>
    <Layout title="카고웍스 사용방법 안내">
      <WebView source={{ html: @props.phrase.content }} originWhitelist={['*']} />
    </Layout>
