export default observer class TermsView extends Component
  onPressTerm: (name) =>
    @props.onPressTerm name

  onPressNext: =>
    @props.onPressNext()

  render: =>
    <Layout title="약관">
      <View style={{ flex: 1, padding: 20 }}>
        <Text bold center size={18} marginTop={10}>
          약관 동의를 하셔야{'\n'}
          카고웍스를 이용하실 수 있습니다.
        </Text>
        <View style={{ flexDirection: 'row', marginTop: 30 }}>
          <View style={{ flex: 1 }}>
            <Checkbox state={@props.state} path="isTermsOfServiceChecked" label="기사 이용약관 (필수)" />
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end', width: 50 }}>
            <Text onPress={=> @onPressTerm 'transporterApp terms of service'}>보기</Text>
            <Image source={require '../../../../images/arrow.png'} style={{ width: 8, height: 14, marginLeft: 5 }} />
          </View>
        </View>
        <View style={{ flexDirection: 'row', marginTop: 25 }}>
          <View style={{ flex: 1 }}>
            <Checkbox state={@props.state} path="isPrivacyPolicyChecked" label="개인정보 보호정책 (필수)" />
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end', width: 50 }}>
            <Text onPress={=> @onPressTerm 'transporterApp privacy policy'}>보기</Text>
            <Image source={require '../../../../images/arrow.png'} style={{ width: 8, height: 14, marginLeft: 5 }} />
          </View>
        </View>
        <View style={{ flexDirection: 'row', marginTop: 25 }}>
          <View style={{ flex: 1 }}>
            <Checkbox state={@props.state} path="isTermsOfLocationInformationChecked" label="위치기반 서비스 이용약관 (필수)" />
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end', width: 50 }}>
            <Text onPress={=> @onPressTerm 'transporterApp gps service terms'}>보기</Text>
            <Image source={require '../../../../images/arrow.png'} style={{ width: 8, height: 14, marginLeft: 5 }} />
          </View>
        </View>
      </View>
      <Button isDisabled={not @props.validation.isValid} borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>다음</Button>
    </Layout>
