export default observer class UpdateInsuranceForOthersView extends Component
  constructor: (props) ->
    super props

    @state = observable
      value: @props.state.value
      isAgreeChecked: false

  onChangeInput: (value, isValid, name) =>
    @state.value[name] = value

    @props.validation[name] = isValid

  onChangeCheckbox: (isChecked, name) =>
    if name is 'isntAgreeChecked'
      @state.isAgreeChecked = false

      @state.value.name = ''
      @state.value.idNumber = ''

    else if name is 'isAgreeChecked'
      @state.isAgreeChecked = true

  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="적재물배상책임보험">
      <ScrollView style={{ padding: 20 }}>
        <Text>
          적재물배상책임보험에 가입되어 있거나 피보험자로 가입하셔야 합니다.{'\n'}
          가입정보는 운송주선사도 공유하여 배차에영향을 줄 수 있습니다.{'\n'}
          {'\n'}
          가입에 동의하시면 매월 25일에 0000원이 충전금에서 차감되며익월 1일 0시부터 보험이 적용됩니다.{'\n'}
          {'\n'}
          보상 최고한도 : 5천만원
        </Text>
        <Checkbox isRadio label={<Text>이미 개인적으로 적재물배상책임보험에 가입되어있습니다.</Text>} marginTop={30} onChange={@onChangeCheckbox} name="isntAgreeChecked" isChecked={not @state.isAgreeChecked} />
        <Checkbox isRadio label={<Text>카고웍스의 적재물배상책임보험 피보험자 가입에 동의합니다. (선택)</Text>} marginTop={20} onChange={@onChangeCheckbox} name="isAgreeChecked" isChecked={@state.isAgreeChecked} />
        { @state.isAgreeChecked and
          <View>
            <Input isRequired placeholder="이름(실명)" marginTop={10} onChange={@onChangeInput} name="name" value={@state.value.name} />
            <Input isRequired placeholder="주민등록번호" marginTop={10} onChange={@onChangeInput} name="idNumber" value={@state.value.idNumber} />
          </View>
          }
      </ScrollView>
      <Button isDisabled={not @props.validation.isValid and @state.isAgreeChecked} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
