import UpdateBusinessCertView from './UpdateBusinessCertView.coffee'
import withHandler from './withHandler.coffee'
import withReaction from './withReaction.coffee'

getSelector = (props) =>
  _id: props.user.profile.transporterId

getDefaultState = (props) =>
  value:
    taxType: props.transporter.taxType
    regNumber: props.transporter.regNumber
    storeName: props.transporter.regName
    name: props.transporter.ownerName
    address: props.transporter.address
    contactNumber: props.transporter.contactNumber or ''
  isRegNumberValid: if props.transporter.regNumber then true else false
  isRegNumberChecked: if props.transporter.regNumber then true else false
  isUpdated: false

getItems = (props) =>
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
    getError: (value) =>
      if not props.state.value.regNumber
        return ''

      if not value
        return '사업자등록번호가 유효하지 않습니다.'

      ''
    validate: 'true'
  ,
    path: 'isRegNumberChecked'
    getError: (value) =>
      if not props.state.value.regNumber
        return ''

      if not value
        return '사업자등록번호를 확인해주세요.'

      ''
    validate: 'true'
  ]

getHocs = =>
  [
    withConstant('transporters')
    withRouteParam
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withValidation(getItems)
    withHandler
    withReaction
  ]

export default UpdateBusinessCert = withHocs(getHocs) UpdateBusinessCertView
