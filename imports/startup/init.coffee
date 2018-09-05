import 'moment/locale/ko'
import state from '../etc/state.coffee'
import { Dimensions } from 'react-native'

global.state = state

global.width = Dimensions.get('window').width
global.height = Dimensions.get('window').height

global.isProduction = false
# global.isProduction = true
