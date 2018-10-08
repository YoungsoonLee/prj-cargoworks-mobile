import AppInfoView from './AppInfoView.coffee'
import withHandler from './withHandler.coffee'

export default AppInfo = withFindOne('globals') withHandler AppInfoView
