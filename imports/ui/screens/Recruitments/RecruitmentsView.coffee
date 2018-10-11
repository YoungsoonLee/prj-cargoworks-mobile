import Recruitment from './Recruitment.coffee'

export default observer class RecruitmentsView extends Component
  onPressRecruitment: (recruitment) =>
    @props.onPressRecruitment recruitment

  renderRecruitments: =>
    @props.recruitments.map (recruitment, index) =>
      <Recruitment transporter={@props.transporter} RECRUITMENTS={@props.RECRUITMENTS} onPress={=> @onPressRecruitment recruitment} isBorderTopVisible={index is 0} key={recruitment._id} recruitment={recruitment} />

  render: =>
    <Layout title="전담기사 모집공고">
      <ScrollView>
        { @renderRecruitments() }
      </ScrollView>
    </Layout>
