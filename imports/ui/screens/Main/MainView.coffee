import MainLayout from '../../layouts/MainLayout/MainLayout.coffee'
import TabNavigator from '../../navigators/TabNavigator/TabNavigator.coffee'
import tabNavigation from '../../../etc/tab_navigation.coffee'
import OneSignal from 'react-native-onesignal'
import Geolocation from 'react-native-geolocation-service'
import backgroundTimer from 'react-native-background-timer'
import { PermissionsAndroid, Platform } from 'react-native'

export default observer class MainView extends Component
  updateLocation: =>
    Geolocation.getCurrentPosition (position) =>
      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $set:
          'currentGeoLocation.longitude': position.coords.longitude
          'currentGeoLocation.latitude': position.coords.latitude
      , (error) =>
        if error
          Util.alert error.reason

          return

        Meteor.call 'orders.updateOrderAddressStatus', position.coords.longitude, position.coords.latitude, (error) =>
          if error
            Util.alert error.reason

            return
    ,
      (error) =>
        if error
          console.log error.code, error.message
    ,
        enableHighAccuracy: true
        timeout: 15000
        maximumAge: 10000

  requestLocationPermission: =>
    if Platform.OS is 'android'
      try
        await PermissionsAndroid.request PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
          title: '위치정보에 대한 권한이 필요합니다.'
          message: '현재 위치를 알기 위해서 디바이스의 위치정보에 대한 권한이 필요합니다.'

      catch error
        console.log error

  componentDidMount: =>
    Util.go 'Invitation'
    @requestLocationPermission()

    @updateLocation()

    backgroundTimer.runBackgroundTimer =>
      @updateLocation()
    , 10 * 1000

    @timeoutId = setTimeout =>
      mobileNumber = @props.transporter.mobileNumbers.find (mobileNumber) =>
        mobileNumber.isPrimary and mobileNumber.isTakenOverByOthers

      if mobileNumber
        Util.confirm '''
          전화번호 인증이 필요합니다.
          인증 화면으로 이동합니다.
        ''', =>
          Util.go 'PhoneNumbers'
        , 2000

  componentWillUnmount: =>
    backgroundTimer.stopBackgroundTimer()

    clearTimeout @timeoutId

  render: =>
    <MainLayout>
      <TabNavigator ref={(ref) => tabNavigation.setRef ref} />
    </MainLayout>
