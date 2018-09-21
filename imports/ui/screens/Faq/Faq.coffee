import FaqView from './FaqView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id

getHocs = =>
  [
    withRouteParam
    withFindOne('notices', getSelector)
  ]

export default Notice = withHocs(getHocs) FaqView
