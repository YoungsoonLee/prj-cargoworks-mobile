import RecruitmentView from './RecruitmentView.coffee'
import withMeta from './withMeta.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withRouteParam
    withHandler
    withMeta
  ]

export default Recruitment = withHocs(getHocs) RecruitmentView
