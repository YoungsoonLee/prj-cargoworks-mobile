import SettingView from './SettingView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withHandler
  ]

export default Setting = withHocs(getHocs) SettingView
