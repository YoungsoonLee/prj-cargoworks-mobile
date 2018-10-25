import { WebView } from 'react-native'

export default observer class WaypointsMapView extends Component
  render: =>
    <Layout title="지도">
      <WebView originWhitelist={['*']} source={{ uri: "http://#{backendIp}/waypoints-map/#{@props.user.profile.transporterId}/#{@props.routeParam.orderId}/#{width}/#{height}" }} />
    </Layout>
