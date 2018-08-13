import MyOrderDetail from '../../components/MyOrderDetail/MyOrderDetail.coffee'

export default observer class MyOrderDetailView extends Component
  render: =>
    <Layout title="픽업 운행 중">
      <MyOrderDetail />
    </Layout>
