import UpdateInsuranceForOthersView from './UpdateInsuranceForOthersView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  value:
    name: ''
    idNumber: ''

export default UpdateInsuranceForOthers = withUser() withState(getDefaultState) withValidation(['name', 'idNumber']) withHandler UpdateInsuranceForOthersView
