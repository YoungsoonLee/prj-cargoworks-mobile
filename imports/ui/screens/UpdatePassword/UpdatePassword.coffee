import UpdatePasswordView from './UpdatePasswordView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  password: ''
  newPassword: ''
  newPasswordConfirm: ''

getItems = (props) =>
  [
    path: 'password'
    isRequired: true
  ,
    path: 'newPassword'
    validate: 'password'
    isRequired: true
  ,
    path: 'newPasswordConfirm'
    validate: (value) =>
      if value isnt props.state.newPassword
        return false

      true
    getError: (value) =>
      if value isnt props.state.newPassword
        return '비밀번호가 같지 않습니다.'

      ''
  ]

getHocs = =>
  [
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default UpdatePassword = withHocs(getHocs) UpdatePasswordView
