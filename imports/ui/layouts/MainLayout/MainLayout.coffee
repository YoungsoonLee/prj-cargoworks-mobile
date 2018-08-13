import Header from '../../components/Header/Header.coffee'

export default observer class MainLayout extends Component
  render: =>
    <View style={{ flex: 1 }}>
      <StatusBar />
      <Header />
      <View style={{ flex: 1 }}>
        { @props.children }
      </View>
    </View>
