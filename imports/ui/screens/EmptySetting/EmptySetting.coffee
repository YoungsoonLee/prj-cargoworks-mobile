import EmptySettingView from './EmptySettingView.coffee'
import Calendar from './Calendar.coffee'
import withModal from './withModal.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  isEmpty: false
  address: ''
  startDate: null
  startTime: null
  isMixed: false
  mixType: '1/1'
  isDateModalVisible: false

getHocs = =>
  [
    withState(getDefaultState)
    withModal
    withHandler
  ]

export default EmptySetting = withHocs(getHocs) EmptySettingView
