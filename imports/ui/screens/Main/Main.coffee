import MainView from './MainView.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

export default Main = withUser() withFindOne('transporters', getSelector) MainView
