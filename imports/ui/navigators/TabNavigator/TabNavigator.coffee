import { TabNavigator } from 'react-navigation'
import Tab from '../../components/Tab.coffee'

export default TabNavigator
  DailyGoldspoon:
    screen: TabMain
,
  tabBarComponent: Tab
  tabBarPosition: 'bottom'
  swipeEnabled: false
  animationEnabled: true
  backBehavior: 'none'
