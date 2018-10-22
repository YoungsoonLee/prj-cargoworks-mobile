export default observer class UpdateInsuranceView extends Component
  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="적재물배상책임보험">
      <ScrollView style={{ padding: 20 }} paddingBottom={300}>
        <Text>
          적재물배상책임보험에 피보험자로 가입하셔야 합니다. 가입정보는 운송주선사도 공유하여 배차에 영향을 줄 수 있습니다.{'\n'}
          {'\n'}
          가입에 동의하시면 매월 25일에 { @props.insurance.PARCEL_MOTOR_BIKE }원이 충전금에서 차감되며 익월 1일 0시부터 보험이 적용됩니다.{'\n'}
          {'\n'}
          보상 최고한도 : 2천만원
        </Text>
        <Checkbox label={<Text>카고웍스의 적재물배상책임보험 피보험자 가입에 동의합니다. (필수)</Text>} marginTop={30} state={@props.state} path="isAgreeChecked" />
        <Input isRequired placeholder="이름(실명)" marginTop={10} state={@props.state} path="name" />
        <Input isRequired placeholder="주민등록번호" marginTop={10} state={@props.state} path="idNumber" />
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
