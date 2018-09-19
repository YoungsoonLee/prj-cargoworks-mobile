import MyAgent from './MyAgent.coffee'

export default observer class MyAgentsView extends Component
  onPressMyAgent: (recruitment) =>
    @props.onPressMyAgent recruitment

  renderMyAgents: =>
    recruitments = [0..5]

    recruitments.map (recruitment, index) =>
      <MyAgent onPress={=> @onPressMyAgent recruitment} isBorderTopVisible={index is 0} key={recruitment} recruitment={recruitment} />

  render: =>
    <Layout title="전담기사 모집공고">
      <ScrollView>
        { @renderMyAgents() }
      </ScrollView>
    </Layout>
