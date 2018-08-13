import OrdersView from './OrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'

export default Orders = withLazyLoad(0) withFind('orders') OrdersView
