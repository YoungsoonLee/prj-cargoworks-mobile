import 'moment/locale/ko'
import state from '../etc/state.coffee'
import { Dimensions } from 'react-native'
import settings from '../../../settings.json'
import { setJSExceptionHandler, setNativeExceptionHandler } from 'react-native-exception-handler'

global.state = state

global.width = Dimensions.get('window').width
global.height = Dimensions.get('window').height

Meteor.settings = settings

global.isProduction = Meteor.settings.isProduction
# global.isProduction = true

setJSExceptionHandler (error) =>
  console.log error

  errorString = JSON.stringify error, Object.getOwnPropertyNames error

  alert = (errorString) =>
    setTimeout =>
      # Util.alert """
      #   #{errorString.slice 0, 100}
      # """
    , 500

  if not isProduction
    Meteor.call 'errors.insert',
      type: 'js'
      error: errorString
    , (error) =>
      if error
        Util.alert error.reason

        return

      alert errorString

  else
    alert errorString
, true
