import SelectVehiclePopupView from './SelectVehiclePopupView.coffee'

getDefaultState = =>
  vehicles: []

getHocs = =>
  [
    withState(getDefaultState, 'cState')
    withConstant('transporters')
  ]

export default SelectVehiclePopup = withHocs(getHocs) SelectVehiclePopupView
