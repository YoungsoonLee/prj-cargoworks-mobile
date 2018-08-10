import { StackNavigator } from 'react-navigation'
import Splash from '../../screens/Splash/Splash.coffee'
import SignupInfo from '../../screens/SignupInfo/SignupInfo.coffee'
import Login from '../../screens/Login/Login.coffee'
import VerifyPhoneNumber from '../../screens/VerifyPhoneNumber/VerifyPhoneNumber.coffee'
import Terms from '../../screens/Terms/Terms.coffee'
import Term from '../../screens/Term/Term.coffee'
import Signup from '../../screens/Signup/Signup.coffee'
import UpdateVehicle from '../../screens/UpdateVehicle/UpdateVehicle.coffee'
import UpdateInsurance from '../../screens/UpdateInsurance/UpdateInsurance.coffee'
import UpdateInsuranceForOthers from '../../screens/UpdateInsuranceForOthers/UpdateInsuranceForOthers.coffee'
import BusinessCert from '../../screens/BusinessCert/BusinessCert.coffee'
import BankAccount from '../../screens/BankAccount/BankAccount.coffee'
import Pending from '../../screens/Pending/Pending.coffee'
import Main from '../../screens/Main/Main.coffee'

export default StackNavigator
  Splash:
    screen: Splash
  SignupInfo:
    screen: SignupInfo
  Login:
    screen: Login
  VerifyPhoneNumber:
    screen: VerifyPhoneNumber
  Terms:
    screen: Terms
  Term:
    screen: Term
  Signup:
    screen: Signup
  UpdateVehicle:
    screen: UpdateVehicle
  UpdateInsurance:
    screen: UpdateInsurance
  UpdateInsuranceForOthers:
    screen: UpdateInsuranceForOthers
  BusinessCert:
    screen: BusinessCert
  BankAccount:
    screen: BankAccount
  Pending:
    screen: Pending
  Main:
    screen: Main
,
  headerMode: 'none'
