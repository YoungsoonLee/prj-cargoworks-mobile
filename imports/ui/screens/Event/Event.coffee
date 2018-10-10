import EventView from './EventView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id

getHocs = =>
  [
    withRouteParam
    withFindOne('events', getSelector)
  ]

export default Event = withHocs(getHocs) EventView
