import OneSignal from 'react-native-onesignal'

OneSignal.init 'bd217327-d381-48b4-9c87-e34d4ace0464',
  kOSSettingsKeyInFocusDisplayOption: 2

OneSignal.addEventListener 'opened', =>
  Util.go 'Setting'
