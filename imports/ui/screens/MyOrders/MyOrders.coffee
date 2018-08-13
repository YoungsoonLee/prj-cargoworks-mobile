import MyOrdersView from './MyOrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'

export default MyOrders = withLazyLoad(0) withFind('orders') MyOrdersView
