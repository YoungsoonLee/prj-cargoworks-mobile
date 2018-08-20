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
import OrderDetail from '../../screens/OrderDetail/OrderDetail.coffee'
import MyOrderDetail from '../../screens/MyOrderDetail/MyOrderDetail.coffee'
import GetSignature from '../../screens/GetSignature/GetSignature.coffee'
import UploadFreightCert from '../../screens/UploadFreightCert/UploadFreightCert.coffee'
import PublishCashReceipt from '../../screens/PublishCashReceipt/PublishCashReceipt.coffee'
import Agent from '../../screens/Agent/Agent.coffee'
import OrderGetSetting from '../../screens/OrderGetSetting/OrderGetSetting.coffee'
import EmptySetting from '../../screens/EmptySetting/EmptySetting.coffee'

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
  OrderDetail:
    screen: OrderDetail
  MyOrderDetail:
    screen: MyOrderDetail
  GetSignature:
    screen: GetSignature
  UploadFreightCert:
    screen: UploadFreightCert
  PublishCashReceipt:
    screen: PublishCashReceipt
  Agent:
    screen: Agent
  OrderGetSetting:
    screen: OrderGetSetting
  EmptySetting:
    screen: EmptySetting
,
  headerMode: 'none'
