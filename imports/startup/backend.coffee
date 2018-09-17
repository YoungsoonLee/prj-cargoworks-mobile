if Meteor.isProduction
  global.backendIp = Meteor.settings.productionBackendIp

else
  global.backendIp = Meteor.settings.developmentBackendIp

Meteor.connect "ws://#{backendIp}/websocket"
