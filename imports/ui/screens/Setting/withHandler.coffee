export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
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

    onPressSignout: =>
      Util.confirm '회원탈퇴 하시겠습니까?', =>
        Util.signout =>
          Util.reset 'Login'

    render: =>
      <WrappedComponent {...@props} onPressLogout={@onPressLogout} onPressListItem={@onPressListItem} onPressTerm={@onPressTerm} onPressSignout={@onPressSignout} />
