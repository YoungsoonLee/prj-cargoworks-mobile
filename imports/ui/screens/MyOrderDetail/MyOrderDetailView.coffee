import MyOrderDetail from '../../components/MyOrderDetail/MyOrderDetail.coffee'

export default observer class MyOrderDetailView extends Component
  render: =>
    <Layout title={@props.ORDERS.STATUS[@props.order.status].TEXT}>
      <MyOrderDetail order={@props.order} />
    </Layout>
