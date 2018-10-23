export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressLogout: =>
      Util.confirm '로그아웃 하시겠습니까?', =>
        Util.logout =>
          Util.reset 'Login'

    onPressListItem: (name) =>
      if name is 'UpdateBusinessCert'
        if @props.transporter.vehicleWeightCapacity is 'MOTOR_BIKE'
          Util.alert '오토바이는 사업자 등록을 할 수 없습니다.'

          return

      if name is 'insurance'
        if @props.transporter.vehicleWeightCapacity is 'MOTOR_BIKE'
          Util.go 'UpdateInsurance',
            type: 'update'

        else
          Util.go 'UpdateInsuranceForOthers',
            type: 'update'

      else
        Util.go name,
          type: 'update'

    onPressTerm: (name) =>
      Util.go 'Term',
        name: name

    onPressSignout: =>
      Util.confirm '회원탈퇴 하시겠습니까?', =>
        Util.signout =>
          Util.reset 'Login'

    render: =>
      <WrappedComponent {...@props} onPressLogout={@onPressLogout} onPressListItem={@onPressListItem} onPressTerm={@onPressTerm} onPressSignout={@onPressSignout} />
