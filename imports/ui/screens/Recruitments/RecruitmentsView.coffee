import Recruitment from './Recruitment.coffee'

export default observer class RecruitmentsView extends Component
  onPressRecruitment: (recruitment) =>
    @props.onPressRecruitment recruitment

  renderRecruitments: =>
    recruitments = [0..5]

    recruitments.map (recruitment, index) =>
      <Recruitment onPress={=> @onPressRecruitment recruitment} isBorderTopVisible={index is 0} key={recruitment} recruitment={recruitment} />

  render: =>
    <Layout title="전담기사 모집공고">
      <ScrollView>
        { @renderRecruitments() }
      </ScrollView>
    </Layout>
