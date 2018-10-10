import CwHeader from '../../components/CwHeader/CwHeader.coffee'

export default observer class Setting extends Component
  onPressLogout: =>
    Util.confirm '로그아웃 하시겠습니까?', =>
      Util.logout =>
        Util.reset 'Login'

  onPressListItem: (name) =>
    Util.go name,
      type: 'update'

  onPressTerm: (name) =>
    Util.go 'Term',
      name: name

  render: =>
    <Layout title="설정">
      <ScrollView>
        <CwHeader>개인정보설정</CwHeader>
        <ListItem onPress={@onPressListItem} name="PhoneNumbers">휴대폰 번호 관리</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdatePassword">비밀번호 변경</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdateVehicle">내 차량정보 설정</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdateBusinessCert">사업자등록 설정</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdateBankAccount">환급계좌 및 현금영수증 설정</ListItem>
        <ListItem isBorderBottomVisible={false} onPress={@onPressListItem} name="MyAgents">소속 운송사 설정</ListItem>
        <CwHeader>프로모션</CwHeader>
        <ListItem onPress={@onPressListItem} name="Events">이벤트</ListItem>
        <ListItem onPress={@onPressListItem} name="Notifications" isBorderBottomVisible={false}>푸쉬알림</ListItem>
        <CwHeader>고객센터</CwHeader>
        <ListItem onPress={@onPressListItem} name="Notices">공지사항</ListItem>
        <ListItem onPress={@onPressListItem} name="Faqs">자주 묻는 질문</ListItem>
        <ListItem onPress={@onPressListItem} name="Qnas">문의하기</ListItem>
        <ListItem onPress={@onPressTerm} name="transporterApp terms of service">서비스 이용약관</ListItem>
        <ListItem onPress={@onPressTerm} name="transporterApp privacy policy">개인정보 보호정책</ListItem>
        <ListItem onPress={@onPressTerm} name="transporterApp gps service terms">위치기반 서비스 이용약관</ListItem>
        <ListItem isBorderBottomVisible={false} onPress={@onPressListItem} name="AppInfo">어플리케이션 정보</ListItem>
        <CwHeader>계정</CwHeader>
        <ListItem onPress={@onPressLogout}>로그아웃</ListItem>
        <ListItem>탈퇴</ListItem>
      </ScrollView>
    </Layout>
