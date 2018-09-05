if isProduction
  global.backendIp = 'test.cargoworks.cc'

else
  global.backendIp = 'test.cargoworks.cc'

Meteor.connect "ws://#{backendIp}/websocket"
