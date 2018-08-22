import SignupView from './SignupView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  value:
    username: ''
    password: ''
    passwordConfirm: ''

export default Signup = withDefaultObject('transporters') withState(getDefaultState) withValidation(['username', 'password', 'passwordConfirm']) withHandler SignupView
