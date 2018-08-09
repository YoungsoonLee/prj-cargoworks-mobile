export default observer class Terms extends Component
  constructor: (props) ->
    super props

    @state = observable
      isTermsOfServiceChecked: false
      isPrivacyPolicyChecked: false
      isTermsOfLocationInformationChecked: false
      isValid: false

    reaction(
      =>
        @validate()
    ,
      =>
        @state.isValid = @validate()
    )

  onPressTerm: (type) =>
    Util.go 'Term',
      type: type

  onChangeCheckbox: (isChecked, name) =>
    @state[name] = isChecked

  validate: =>
    if not @state.isTermsOfServiceChecked
      return false

    if not @state.isPrivacyPolicyChecked
      return false

    if not @state.isTermsOfLocationInformationChecked
      return false

    true

  onPressNex: =>
    Util.go 'Signup'

  render: =>
    <Layout title="약관">
      <View style={{ flex: 1, padding: 20 }}>
        <Text bold center size={18} marginTop={10}>
          약관 동의를 하셔야{'\n'}
          카고웍스를 이용하실 수 있습니다.
        </Text>
        <View style={{ flexDirection: 'row', marginTop: 30 }}>
          <View style={{ flex: 1 }}>
            <Checkbox onChange={@onChangeCheckbox} name="isTermsOfServiceChecked" isChecked={@state.isTermsOfServiceChecked} label={<Text color="#cccccc" size={18}>기사 이용약관 (필수)</Text>} />
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end', width: 50 }}>
            <Text onPress={=> @onPressTerm 'terms of service'}>보기</Text>
            <Image source={require '../../../../images/arrow.png'} style={{ width: 8, height: 14, marginLeft: 5 }} />
          </View>
        </View>
        <View style={{ flexDirection: 'row', marginTop: 12 }}>
          <View style={{ flex: 1 }}>
            <Checkbox onChange={@onChangeCheckbox} name="isPrivacyPolicyChecked" isChecked={@state.isPrivacyPolicyChecked} label={<Text color="#cccccc" size={18}>개인정보 보호정책 (필수)</Text>} />
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end', width: 50 }}>
            <Text onPress={=> @onPressTerm 'privacy policy'}>보기</Text>
            <Image source={require '../../../../images/arrow.png'} style={{ width: 8, height: 14, marginLeft: 5 }} />
          </View>
        </View>
        <View style={{ flexDirection: 'row', marginTop: 12 }}>
          <View style={{ flex: 1 }}>
            <Checkbox onChange={@onChangeCheckbox} name="isTermsOfLocationInformationChecked" isChecked={@state.isTermsOfLocationInformationChecked} label={<Text color="#cccccc" size={18}>위치기반 서비스 이용약관 (필수)</Text>} />
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end', width: 50 }}>
            <Text onPress={=> @onPressTerm 'terms of location information'}>보기</Text>
            <Image source={require '../../../../images/arrow.png'} style={{ width: 8, height: 14, marginLeft: 5 }} />
          </View>
        </View>
      </View>
      <Button isDisabled={not @state.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNex}>다음</Button>
    </Layout>
