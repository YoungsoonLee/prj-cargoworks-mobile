import { TabNavigator } from 'react-navigation'
import TabMenu from '../../components/TabMenu/TabMenu.coffee'
import Orders from '../../screens/Orders/Orders.coffee'
import MyOrders from '../../screens/MyOrders/MyOrders.coffee'
import OrderSetting from '../../screens/OrderSetting/OrderSetting.coffee'
import Balances from '../../screens/Balances/Balances.coffee'

export default TabNavigator
  Orders:
    screen: Orders
  MyOrders:
    screen: MyOrders
  OrderSetting:
    screen: OrderSetting
  Balances:
    screen: Balances
,
  tabBarComponent: TabMenu
  tabBarPosition: 'bottom'
  swipeEnabled: false
  animationEnabled: true
  backBehavior: 'none'
