import MainLayout from '../../layouts/MainLayout/MainLayout.coffee'
import TabNavigator from '../../navigators/TabNavigator/TabNavigator.coffee'
import tabNavigation from '../../../etc/tab_navigation.coffee'

export default observer class Main extends Component
  render: =>
    <MainLayout>
      <TabNavigator ref={(ref) => tabNavigation.setRef ref} />
    </MainLayout>
