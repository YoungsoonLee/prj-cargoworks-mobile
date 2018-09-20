import { Accounts } from 'react-native-meteor'

export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressConfirm: =>
      Accounts.changePassword @props.state.password, @props.state.newPassword, (error) =>
        if error
          if error.reason is 'Incorrect password'
            Util.alert '비밀번호가 틀립니다.'

          else
            Util.alert error.reason

          return

        Util.alert '비밀번호가 변경되었습니다.'

        Util.back()

    render: =>
      <WrappedComponent {...@props} onPressConfirm={@onPressConfirm} />
