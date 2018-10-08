import Splash from '../Splash/Splash.coffee'
import { Linking, Platform } from 'react-native'

export default observer class ForceUpdateView extends Component
  componentDidMount: =>
    message = """
      필수 업데이트가 있습니다.
      현재버전: #{Meteor.settings.version}, 최신버전: #{@props.global.latestVersion}
      앱스토어로 이동하시겠습니까?
    """

    Util.confirm message, =>
      if Platform.OS is 'ios'
        Linking.openURL 'https://itunes.apple.com/app/id1433650049'

      else if Platform.OS is 'android'
        Linking.openURL 'http://play.google.com/store/apps/details?id=cc.cargoworks'

  render: =>
    <Splash />
