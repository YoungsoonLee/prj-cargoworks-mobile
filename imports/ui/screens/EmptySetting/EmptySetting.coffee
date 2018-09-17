import EmptySettingView from './EmptySettingView.coffee'
import Calendar from './Calendar.coffee'

getDefaultState = =>
  isEmpty: false
  address: ''
  startDate: null
  startTime: null
  isMixed: false
  mixType: '1/1'
  isDateModalVisible: false

export default EmptySetting = withState(getDefaultState) withModal(Calendar) EmptySettingView
