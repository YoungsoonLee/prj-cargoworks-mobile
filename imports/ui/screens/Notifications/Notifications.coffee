import NotificationsView from './NotificationsView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  console.log props.user._id

  userId: props.user._id

getHocs = =>
  [
    withUser()
    withFind('pushNotifications', getSelector)
    withHandler
  ]

export default Notifications = withHocs(getHocs) NotificationsView
