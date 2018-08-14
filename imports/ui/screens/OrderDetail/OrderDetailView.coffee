import OrderDetail from '../../components/OrderDetail/OrderDetail.coffee'

export default observer class OrderDetailView extends Component
  render: =>
    <Layout title="주문 상세">
      <OrderDetail order={@props.order} />
    </Layout>
