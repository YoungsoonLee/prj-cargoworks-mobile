export default observer class PendingView extends Component
  onPressStart: =>
    @props.onPressStart()

  render: =>
    if @props.transporter.adminApprovalStatus is @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.REQUESTED.VALUE
      state = 'requested'

    else if @props.transporter.adminApprovalStatus is @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.APPROVED.VALUE
      state = 'approved'

    <Layout>
      <View style={{ flex: 1, padding: 20, alignItems: 'center' }}>
        <Image source={require '../../../../images/check.png'} style={{ marginTop: 50, width: 40 * 1.2, height: 30 * 1.2 }} />
        { state is 'requested' and
          <View>
            <Text bold center size={18} marginTop={50}>계정이 생성되었습니다.</Text>
            <Text bold center marginTop={30}>
              카고웍스에서 가입승인 작업을 진행합니다.{'\n'}
              24시간 이내에 완료되며{'\n'}
              승인 완료시 메세지가 전송됩니다.
            </Text>
          </View>
          }
        { state is 'approved' and
          <View>
            <Text bold center size={18} marginTop={50}>가입승인이 완료되었습니다!</Text>
            <Text bold center marginTop={30}>
              카고웍스 드라이버를 처음 사용하신다면{'\n'}
              카고웍스 사용방법 안내를 봐주세요.
            </Text>
            <View style={{ alignItems: 'center', marginTop: 30 }}>
              <Button textSize={16} height={40} width={120} color="black invert">사용방법 안내</Button>
            </View>
          </View>
          }
      </View>
      { state is 'requested' and
        <View style={{ height: 50, backgroundColor: '#edf1fc', justifyContent: 'center', alignItems: 'center' }}>
          <Text color={blue}>카고웍스에서 가입심사 중입니다.</Text>
        </View>
        }
      { state isnt 'approved' and
        <Button borderRadius={0} height={75} color="light blue" onPress={@onPressStart}>카고웍스 시작하기</Button>
        }
    </Layout>
