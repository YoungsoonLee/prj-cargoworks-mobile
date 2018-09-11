import CwHeader from '../../components/CwHeader/CwHeader.coffee'

export default observer class Setting extends Component
  onPressListItem: (name) =>
    if name is 'logout'
      Util.confirm '로그아웃 하시겠습니까?', =>
        Util.logout =>
          Util.reset 'Login'

    else
      Util.go name,
        type: 'update'

  render: =>
    <Layout title="설정">
      <ScrollView>
        <CwHeader>개인정보설정</CwHeader>
        <ListItem onPress={@onPressListItem} name="PhoneNumbers" subTitle="01042322232">휴대폰 번호 관리</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdatePassword">비밀번호 변경</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdateVehicle">내 차량정보 설정</ListItem>
        <ListItem onPress={@onPressListItem} name="UpdateBusinessCert">사업자등록 설정</ListItem>
        <ListItem>환급계좌 및 현금영수증 설정</ListItem>
        <ListItem isBorderBottomVisible={false}>소속 운송사 설정</ListItem>
        <CwHeader>프로모션</CwHeader>
        <ListItem>이벤트</ListItem>
        <ListItem isBorderBottomVisible={false}>푸쉬알림</ListItem>
        <CwHeader>고객센터</CwHeader>
        <ListItem>공지사항</ListItem>
        <ListItem>자주 묻는 질문</ListItem>
        <ListItem onPress={@onPressListItem} name="Qnas">문의하기</ListItem>
        <ListItem>서비스 이용약관</ListItem>
        <ListItem>위치기반 서비스 이용약관</ListItem>
        <ListItem isBorderBottomVisible={false}>어플리케이션 정보</ListItem>
        <CwHeader>계정</CwHeader>
        <ListItem onPress={@onPressListItem} name="logout">로그아웃</ListItem>
        <ListItem>탈퇴</ListItem>
      </ScrollView>
    </Layout>
