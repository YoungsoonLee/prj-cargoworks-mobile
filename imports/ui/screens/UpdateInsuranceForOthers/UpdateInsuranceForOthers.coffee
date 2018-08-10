import UpdateInsuranceForOthersView from './UpdateInsuranceForOthersView.coffee'

getDefaultState = =>
  value:
    name: ''
    idNumber: ''

export default UpdateInsuranceForOthers = withState(getDefaultState) withValidation(['name', 'idNumber']) UpdateInsuranceForOthersView
