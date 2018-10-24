import EmptySettingView from './EmptySettingView.coffee'
import withSelectTimeModal from './withSelectTimeModal.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = (props) =>
  if props.transporter.availableMixCapacity is props.TRANSPORTERS.VEHICLES.FREIGHT.MIX_CAPACITY.FULL.VALUE
    mixType = '1/1'

  else if props.transporter.availableMixCapacity is props.TRANSPORTERS.VEHICLES.FREIGHT.MIX_CAPACITY.HALF.VALUE
    mixType = '1/2'

  else if props.transporter.availableMixCapacity is props.TRANSPORTERS.VEHICLES.FREIGHT.MIX_CAPACITY.ONE_THIRD.VALUE
    mixType = '1/3'

  isEmpty: props.transporter.onEmptyReturn
  address: props.transporter.emptyReturnDesination
  startDate: if props.transporter.emptyReturnStartsDateAt then moment(props.transporter.emptyReturnStartsDateAt) else null
  startTime: if props.transporter.emptyReturnStartsTimeAt then moment(props.transporter.emptyReturnStartsTimeAt) else null
  isMixed: props.transporter.canMixFreight
  mixType: mixType

getSelector = (props) =>
  _id: props.user.profile.transporterId

getState = (props) =>
  props.state

getHocs = =>
  [
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getSelector)
    withState(getDefaultState)
    withSelectDateModal(getState, 'startDate', 'onPressOpenSelectDateModal')
    withSelectTimeModal
    withHandler
  ]

export default EmptySetting = withHocs(getHocs) EmptySettingView
