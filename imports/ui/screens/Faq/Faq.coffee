import FaqView from './FaqView.coffee'

getSelector = (props) =>
  _id: props.routeParam.id

getHocs = =>
  [
    withRouteParam
    withFindOne('faqs', getSelector)
  ]

export default Faq = withHocs(getHocs) FaqView
