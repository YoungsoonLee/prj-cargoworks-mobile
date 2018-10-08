export default observer class Splash extends Component
  render: =>
    <View style={{ backgroundColor: '#ffffff', flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Image
        source={require '../../../../images/splash.png'}
        style={
          width: 200
          height: 200
          marginTop: -60
        }
      />
    </View>
