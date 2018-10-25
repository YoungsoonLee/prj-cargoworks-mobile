import WaypointsMapView from './WaypointsMapView.coffee'

getHocs = =>
  [
    withRouteParam
    withUser()
  ]

export default WaypointsMap = withHocs(getHocs) WaypointsMapView
