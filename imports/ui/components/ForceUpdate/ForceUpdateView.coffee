import Splash from '../Splash/Splash.coffee'
import { Linking, Platform, Alert } from 'react-native'

export default observer class ForceUpdateView extends Component
  componentDidMount: =>
    message = """
      필수 업데이트가 있습니다.
      현재버전: #{Meteor.settings.version}, 최신버전: #{@props.global.latestVersion}
    """

    if Platform.OS is 'ios'
      Util.confirm message, =>
        Linking.openURL 'https://itunes.apple.com/app/id1433650049'

    else if Platform.OS is 'android'
      Alert.alert null, message, [
        text: '취소'
        onPress: =>
      ,
        text: '스토어 이동',
        onPress: =>
          Linking.openURL 'http://play.google.com/store/apps/details?id=cc.cargoworks'
      ,
        text: 'apk 다운로드',
        onPress: =>
          Linking.openURL 'https://s3.ap-northeast-2.amazonaws.com/cargoworks.apks/cargoworks.apk'
      ]

  render: =>
    <Splash />
