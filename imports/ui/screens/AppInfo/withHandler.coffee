import { Linking, Platform } from 'react-native'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressUpdate: =>
      if Platform.OS is 'ios'
        Linking.openURL 'https://itunes.apple.com/app/id1433650049'

      else if Platform.OS is 'android'
        Linking.openURL 'http://play.google.com/store/apps/details?id=cc.cargoworks'

    render: =>
      <WrappedComponent {...@props} onPressUpdate={@onPressUpdate} />
