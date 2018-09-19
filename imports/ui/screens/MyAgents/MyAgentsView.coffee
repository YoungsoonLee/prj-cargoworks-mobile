import MyAgent from './MyAgent.coffee'

export default observer class MyAgentsView extends Component
  renderMyAgents: =>
    recruitments = [0..5]

    recruitments.map (recruitment, index) =>
      <MyAgent isBorderTopVisible={index is 0} key={recruitment} recruitment={recruitment} />

  render: =>
    <Layout title="전담기사 모집공고">
      <ScrollView>
        { @renderMyAgents() }
      </ScrollView>
    </Layout>
