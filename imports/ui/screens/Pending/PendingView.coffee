export default observer class PendingView extends Component
  onPressStart: =>
    @props.onPressStart()

  onPressUsage: =>
    @props.onPressUsage()

  render: =>
    <Layout title={if @props.state is 'update requested' then '검토중' else '계정생성 완료'}>
      <View style={{ flex: 1, padding: 20, alignItems: 'center', justifyContent: 'center' }}>
        <Image source={require '../../../../images/check.png'} style={{ width: 40 * 1.2, height: 30 * 1.2 }} />
        { if @props.state is 'requested'
          <View>
            <Text bold center size={18} marginTop={70}>계정이 생성되었습니다.</Text>
            <Text color="#666666" bold center marginTop={30}>
              카고웍스에서 가입승인 작업을 진행합니다.{'\n'}
              24시간 이내에 완료되며{'\n'}
              승인 완료시 메세지가 전송됩니다.
            </Text>
          </View>
        }
        { if @props.state is 'update requested'
          <View>
            <Text bold center size={18} marginTop={70}>계정을 검토중입니다.</Text>
            <Text color="#666666" bold center marginTop={30}>
              카고웍스에서 계정 검토 작업을 진행합니다.{'\n'}
              24시간 이내에 완료되며{'\n'}
              승인 완료시 메세지가 전송됩니다.
            </Text>
          </View>
        }
        { if @props.state is 'approved'
          <View>
            <Text bold center size={18} marginTop={70}>가입승인이 완료되었습니다!</Text>
            <Text color="#666666" bold center marginTop={30}>
              카고웍스 운전자용 을 처음 사용하시는{'\n'}
              기사님은 사용방법 안내를 참고해주세요.
            </Text>
            <View style={{ alignItems: 'center', marginTop: 50 }}>
              <Button onPress={@onPressUsage} isTextBold={false} textSize={15} height={37} width={125} color="black invert">사용방법 안내</Button>
            </View>
          </View>
        }
      </View>
      { if @props.state is 'requested'
        <View style={{ height: 50, backgroundColor: '#edf1fc', justifyContent: 'center', alignItems: 'center' }}>
          <Text color="#44547e">카고웍스에서 가입심사 중입니다.</Text>
        </View>
      }
      { if @props.state is 'update requested'
        <View style={{ height: 50, backgroundColor: '#edf1fc', justifyContent: 'center', alignItems: 'center' }}>
          <Text color="#44547e">카고웍스에서 계정 검토 중입니다.</Text>
        </View>
      }
      <Button isDisabled={@props.state isnt 'approved'} borderRadius={0} height={75} color="light blue" onPress={@onPressStart}>카고웍스 시작하기</Button>
    </Layout>
