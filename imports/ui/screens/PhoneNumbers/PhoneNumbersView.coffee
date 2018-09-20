import { Platform } from 'react-native'
import deviceInfo from 'react-native-device-info'
import VerifyPhoneNumber from '../../components/VerifyPhoneNumber/VerifyPhoneNumber.coffee'

export default observer class PhoneNumbersView extends Component
  onChangeCheckbox: (isChecked, name) =>
    @props.state.phoneNumbers.forEach (phoneNumber) =>
      phoneNumber.isPrimary = false

    @props.state.phoneNumbers[name].isPrimary = isChecked

  renderPhoneNumbers: =>
    @props.state.phoneNumbers.map (phoneNumber, index) =>
      <View key={phoneNumber.number} style={{ height: 65, flexDirection: 'row', borderBottomWidth: 1, borderBottomColor: '#a6a6a6' }}>
        <View style={{ width: 65, justifyContent: 'center', alignItems: 'center' }}>
          <CheckboxControlled isRadio isChecked={phoneNumber.isPrimary} onChange={@onChangeCheckbox} name="#{index}" />
        </View>
        <View style={{ flex: 1, alignItems: 'center', flexDirection: 'row' }}>
          <Text color={if phoneNumber.isPrimary then '#c12d3a' else '#cccccc'} bold>대표번호</Text>
          <Text color={black} bold marginLeft={12}>{ phoneNumber.number }</Text>
        </View>
        <View style={{ width: 75, justifyContent: 'center', alignItems: 'center' }}>
          <Button color="white and red" width={50} height={35} textSize={13} paddingHorizontal={0}>삭제</Button>
        </View>
      </View>

  onVerify: =>
    @props.onVerify()

  render: =>
    if Platform.OS is 'android'
      phoneNumber =  deviceInfo.getPhoneNumber()

    <Layout title="휴대폰 번호 관리">
      <ScrollView>
        { if Platform.OS is 'android'
          <View style={{ height: 80, justifyContent: 'center', paddingLeft: 30, backgroundColor: '#eeeeee', borderBottomColor: '#a6a6a6', borderBottomWidth: 1, borderTopColor: '#a6a6a6', borderTopWidth: 1 }}>
            <Text size={18} color={black} bold>이 기기의 휴대폰 번호 : { phoneNumber }</Text>
            <Text size={14} marginTop={5}>번호를 변경하시려면 인증을 다시 받으셔야 합니다.</Text>
          </View>
        }
        <View style={{ padding: 20 }}>
          <VerifyPhoneNumber state={@props.state} path="phoneNumber" onVerify={@onVerify} />
        </View>
        <View style={{ height: 80, justifyContent: 'center', paddingLeft: 30, backgroundColor: '#eeeeee', borderBottomColor: '#a6a6a6', borderBottomWidth: 1, borderTopColor: '#a6a6a6', borderTopWidth: 1 }}>
          <Text size={18} color={black} bold>내 휴대폰 전화번호 관리</Text>
          <Text size={14} marginTop={5}>대표 연락처를 선택할 수 있습니다.</Text>
        </View>
        { @renderPhoneNumbers() }
      </ScrollView>
      <Button borderRadius={0} height={75} color="light blue" onPress={@onPressNext}>저장하기</Button>
    </Layout>
