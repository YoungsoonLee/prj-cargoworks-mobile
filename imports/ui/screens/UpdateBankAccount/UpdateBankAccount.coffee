import UpdateBankAccountView from './UpdateBankAccountView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  value:
    bank: props.transporter.withdrawalAccount.bank
    accountNumber: props.transporter.withdrawalAccount.accountNumber
    holderName: props.transporter.withdrawalAccount.holderName
    method: props.transporter.taxationMethod
    number: props.transporter.taxationRegistrationNumber

export default UpdateBankAccount = withConstant('transporters') withUser() withFindOne('transporters', getSelector) withState(getDefaultState) withConstant('accounts') withHandler UpdateBankAccountView
