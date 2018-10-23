import 'moment/locale/ko'
import state from '../etc/state.coffee'
import { Dimensions } from 'react-native'
import settings from '../../../settings.json'
import KeepAwake from 'react-native-keep-awake'

global.state = state

global.width = Dimensions.get('window').width
global.height = Dimensions.get('window').height

Meteor.settings = settings

global.isProduction = Meteor.settings.isProduction
# global.isProduction = true

KeepAwake.activate()
