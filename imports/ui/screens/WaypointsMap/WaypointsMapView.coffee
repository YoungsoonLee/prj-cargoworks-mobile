import { WebView } from 'react-native'

export default observer class WaypointsMapView extends Component
  render: =>
    console.log "http://#{backendIp}/waypoints-map/#{@props.user.profile.transporterId}/#{@props.routeParam.orderId}"
    <Layout title="지도">
      <WebView source={{ uri: "http://#{backendIp}/waypoints-map/#{@props.user.profile.transporterId}/#{@props.routeParam.orderId}" }} />
    </Layout>
