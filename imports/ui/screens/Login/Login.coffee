import LoginView from './LoginView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  id: ''
  password: ''

getItems = =>
  [
    path: 'id'
    validate: 'id'
    isRequired: true
  ,
    path: 'password'
    validate: 'password'
    isRequired: true
  ]

export default Login = withState(getDefaultState) withValidation(getItems) withHandler LoginView
