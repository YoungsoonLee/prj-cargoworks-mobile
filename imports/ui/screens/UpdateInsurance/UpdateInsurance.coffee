import UpdateInsuranceView from './UpdateInsuranceView.coffee'

getDefaultState = =>
  value:
    name: ''
    idNumber: ''

export default UpdateInsurance = withState(getDefaultState) withValidation(['name', 'idNumber']) UpdateInsuranceView
