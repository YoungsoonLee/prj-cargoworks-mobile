import FaqsView from './FaqsView.coffee'
import withHandler from './withHandler.coffee'
import withFilter from './withFilter.coffee'
import { Platform } from 'react-native'

now = new Date()

getSelector = =>
  selector =
    'dateRange.startDate':
      $lte: now
    'dateRange.endDate':
      $gte: now
    $or: [
      platformAll: true
    ]
    transporterApp: true

  if Platform.OS is 'android'
    selector.$or.push
      android: true

  else if Platform.OS is 'ios'
    selector.$or.push
      ios: true

  selector

getDefaultState = =>
  search: ''

getHocs = =>
  [
    withState(getDefaultState)
    withFind('faqs', getSelector)
    withFilter
    withHandler
  ]

export default Faqs = withHocs(getHocs) FaqsView
