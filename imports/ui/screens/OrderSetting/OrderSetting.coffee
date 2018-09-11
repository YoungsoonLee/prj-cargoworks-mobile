import OrderSettingView from './OrderSettingView.coffee'
import withHandler from './withHandler.coffee'
import withMeta from './withMeta.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getSelector)
    withMeta
    withHandler
  ]

export default OrderSetting = withHocs(getHocs) OrderSettingView
