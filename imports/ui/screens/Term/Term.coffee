import TermView from './TermView.coffee'

getSelector = (props) =>
  type: props.routeParam.type

export default Term = withRouteParam withFindOne('phrases', getSelector) TermView
