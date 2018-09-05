import SignupView from './SignupView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  id: ''
  password: ''
  passwordConfirm: ''

getItems = (props) =>
  [
    path: 'id'
    validate: 'id'
    isRequired: true
  ,
    path: 'password'
    validate: 'password'
    isRequired: true
  ,
    path: 'passwordConfirm'
    validate: (value) =>
      if value isnt props.state.password
        return '비밀번호가 같지 않습니다.'

      ''
    isRequired: true
  ]

getHocs = =>
  [
    withDefaultObject('transporters')
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default Signup = withHocs(getHocs) SignupView
