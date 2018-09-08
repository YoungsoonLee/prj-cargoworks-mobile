if isProduction
  global.backendIp = 'test.cargoworks.cc'

else
  global.backendIp = 'test.cargoworks.cc'

global.backendIp = '172.30.1.44:3000'

Meteor.connect "ws://#{backendIp}/websocket"
