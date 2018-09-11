if isProduction
  global.backendIp = 'test.cargoworks.cc'

else
  global.backendIp = '172.30.1.30:3000'

Meteor.connect "ws://#{backendIp}/websocket"
