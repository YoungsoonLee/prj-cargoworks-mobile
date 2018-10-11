import Ionicons from 'react-native-vector-icons/Ionicons'

export default withMeta = (WrappedComponent) =>
  observer class WithMeta extends Component
    render: =>
      menuItems = [
        icon: <Image source={require '../../../../images/wifi.png'} style={{ width: 20, height: 20 }} />
        title: '주문수신설정'
        screen: 'OrderGetSetting'
      ,
        icon: <Image source={require '../../../../images/block.png'} style={{ width: 20, height: 20 }} />
        title: '공차,혼적 등록'
        screen: 'EmptySetting'
      ,
        icon: <Image source={require '../../../../images/map.png'} style={{ width: 20, height: 20 }} />
        title: '지역현황'
        screen: 'OrdersByAddress'
        param:
          depth: 1
          previousAddress: ''
      ,
        icon: <Image source={require '../../../../images/love.png'} style={{ width: 20, height: 20 }} />
        title: '전담거래처'
        screen: 'Recruitments'
      ]

      <WrappedComponent {...@props} menuItems={menuItems} />
