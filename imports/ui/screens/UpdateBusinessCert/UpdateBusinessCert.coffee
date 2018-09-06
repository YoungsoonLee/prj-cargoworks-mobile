import UpdateBusinessCertView from './UpdateBusinessCertView.coffee'
import withHandler from './withHandler.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  value:
    regNumber: props.transporter.regNumber
    storeName: props.transporter.regName
    name: props.transporter.ownerName
    address: props.transporter.address
    contactNumber: props.transporter.phoneNumber
  isRegNumberValid: props.transporter.regNumber and true
  isRegNumberChecked: props.transporter.regNumber and true

getItems = =>
  [
    path: 'value.regNumber'
    isRequired: true
  ,
    path: 'value.storeName'
    isRequired: true
  ,
    path: 'value.name'
    isRequired: true
  ,
    path: 'value.address'
    isRequired: true
  ,
    path: 'value.contactNumber'
    isRequired: true
  ,
    path: 'isRegNumberValid'
    validate: (value) =>
      if not value
        '사업자등록번호가 유효하지 않습니다.'
  ,
    path: 'isRegNumberChecked'
    validate: (value) =>
      if not value
        '사업자등록번호를 확인해주세요.'
  ]

getHocs = =>
  [
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
  ]

export default UpdateBusinessCert = withHocs(getHocs) UpdateBusinessCertView
