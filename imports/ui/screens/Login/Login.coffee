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

getHocs = =>
  [
    withState(getDefaultState)
    withValidation(getItems)
    withConstant('transporters')
    withHandler
  ]

export default Login = withHocs(getHocs) LoginView
