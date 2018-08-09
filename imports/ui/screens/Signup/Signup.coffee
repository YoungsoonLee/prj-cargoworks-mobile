import SignupView from './SignupView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  value:
    username: ''
    password: ''
    passwordConfirm: ''

export default Signup = withState(getDefaultState) withValidation(['username', 'password', 'passwordConfirm']) withHandler SignupView
