if isProduction
  global.backendIp = 'test.cargoworks.cc'

else
  global.backendIp = '192.168.0.36:3000'

global.backendIp = '192.168.0.36:3000'

Meteor.connect "ws://#{backendIp}/websocket"
