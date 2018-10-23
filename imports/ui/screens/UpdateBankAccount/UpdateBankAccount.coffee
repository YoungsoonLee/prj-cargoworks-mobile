import UpdateBankAccountView from './UpdateBankAccountView.coffee'
import withHandler from './withHandler.coffee'
import withReaction from './withReaction.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  value:
    bank: props.transporter.withdrawalAccount.bank
    accountNumber: props.transporter.withdrawalAccount.accountNumber
    holderName: props.transporter.withdrawalAccount.holderName
    method: props.transporter.taxationMethod or '수신안함'
    number: props.transporter.taxationRegistrationNumber
  isUpdated: false

getItems = (props) =>
  [
    path: 'value.accountNumber'
    isRequired: true
  ,
    path: 'value.holderName'
    isRequired: true
  ,
    path: 'value.number'
    validate: (value) =>
      if props.state.value.method isnt '수신안함'
        if not value
          return false

      true
  ]

getHocs = =>
  [
    withRouteParam
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withConstant('accounts')
    withValidation(getItems)
    withHandler
    withReaction
  ]

export default UpdateBankAccount = withHocs(getHocs) UpdateBankAccountView
