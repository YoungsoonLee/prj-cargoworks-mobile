import EmptySettingView from './EmptySettingView.coffee'
import withSelectDateModal from './withSelectDateModal.coffee'
import withSelectTimeModal from './withSelectTimeModal.coffee'
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
    withSelectDateModal
    withSelectTimeModal
    withHandler
  ]

export default EmptySetting = withHocs(getHocs) EmptySettingView
