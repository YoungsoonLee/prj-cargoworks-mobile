if isProduction
  global.backendIp = 'cargoworks.cc'

else
  global.backendIp = '192.168.0.36:3000'

Meteor.connect "ws://#{global.backendIp}/websocket"
