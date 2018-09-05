import TermView from './TermView.coffee'

getSelector = (props) =>
  name: props.routeParam.name

export default Term = withRouteParam withFindOne('phrases', getSelector) TermView
