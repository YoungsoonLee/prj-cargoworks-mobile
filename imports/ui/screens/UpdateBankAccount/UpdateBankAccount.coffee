import UpdateBankAccountView from './UpdateBankAccountView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  value:
    bank: ''
    accountNumber: ''
    holderName: ''
    method: '선택안함'
    number: ''

export default UpdateBankAccount = withUser() withState(getDefaultState) withConstant('accounts') withHandler UpdateBankAccountView
