import SplashView from './SplashView.coffee'

getSelector = (props) =>
  _id: props.user.profile?.transporterId

export default Splash = withConnection withUser(false, false) withFindOne('transporters', getSelector) withConstant('transporters') SplashView
