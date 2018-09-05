import TermsView from './TermsView.coffee'
import withHandler from './withHandler.coffee'

getDefaultState = =>
  isTermsOfServiceChecked: false
  isPrivacyPolicyChecked: false
  isTermsOfLocationInformationChecked: false

getItems = =>
  [
    path: 'isTermsOfServiceChecked'
    validate: 'true'
  ,
    path: 'isPrivacyPolicyChecked'
    validate: 'true'
  ,
    path: 'isTermsOfLocationInformationChecked'
    validate: 'true'
  ]

export default Terms = withState(getDefaultState) withValidation(getItems) withHandler TermsView
