import OrdersView from './OrdersView.coffee'
import withLazyLoad from '../../../hocs/etc/withLazyLoad.coffee'
import withProps from './withProps.coffee'
import deviceInfo from 'react-native-device-info'

getOrdersSelector = (props) =>
  # 필터링해야하는 것들
  # 1. status가 dispatching 중인 것들
  # 2. 최대 거리 (withProps에서 filter)
  # 3. 수신할 차량
  # 4. 소속 운송사만 보기가 켜져있을 경우 소속 운송사의 배차만
  # 5. 지정배차는 가져오지 않는다

  # 1. status가 dispatching 중인 것들
  # 5. 지정배차는 가져오지 않는다
  selector =
    status: props.ORDERS.STATUS.DISPATCHING.VALUE
    dispatchType:
      $ne: 'DESIGNATED'

  deviceId =  deviceInfo.getUniqueID()

  orderFilterConfiguration = props.transporter.orderFilterConfigurations.find (orderFilterConfiguration) =>
    orderFilterConfiguration.deviceId is deviceId

  if orderFilterConfiguration
    # 3. 수신할 차량
    if orderFilterConfiguration.vehicles.length > 0
      # 다음과 같은 형태로 selector를 만든다.
      # $or: [
      #   vehicleWeightCapacity: ''
      #   freightBoxType: ''
      # ,
      #   vehicleWeightCapacity: ''
      #   freightBoxType: ''
      # ,
      #   ...
      # ]

      selector.$or = []

      orderFilterConfiguration.vehicles.forEach (vehicle) =>
        subSelector =
          vehicleWeightCapacity: vehicle.weight

        if vehicle.boxType
          _.extend subSelector,
            freightBoxType: vehicle.boxType

        selector.$or.push subSelector

    # 4. 소속 운송사만 보기가 켜져있을 경우 소속 운송사의 배차만
    if orderFilterConfiguration.isOnlyMyAgentOrder
      _.extend selector,
        'agent._id': props.transporter.agentId

  selector

getOrdersOption = =>
  sort:
    createdAt: -1

getTransportersSelector = (props) =>
  _id: props.user.profile.transporterId

getHocs = =>
  [
    withLazyLoad(0)
    withConstant('transporters')
    withUser()
    withFindOne('transporters', getTransportersSelector)
    withConstant('orders')
    withFind('orders', getOrdersSelector, getOrdersOption)
    withProps
  ]

export default Orders = withHocs(getHocs) OrdersView
