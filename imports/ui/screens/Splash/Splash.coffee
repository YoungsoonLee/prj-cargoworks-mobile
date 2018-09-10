import SplashView from './SplashView.coffee'

getSelector = (props) =>
  _id: props.user.profile?.transporterId

export default Splash = withConnection withUser(false) withFindOne('transporters', getSelector, =>, isDocNeeded: false) withConstant('transporters') SplashView
