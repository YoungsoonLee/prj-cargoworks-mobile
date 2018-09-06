import SelectVehiclePopupView from './SelectVehiclePopupView.coffee'

getDefaultState = (props) =>
  vehicles: [_get props.state, props.vehiclePath]

getHocs = =>
  [
    withState(getDefaultState, 'cState')
    withConstant('transporters')
  ]

export default SelectVehiclePopup = withHocs(getHocs) SelectVehiclePopupView
