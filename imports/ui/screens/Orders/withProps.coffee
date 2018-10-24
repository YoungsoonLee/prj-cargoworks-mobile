import deviceInfo from 'react-native-device-info'

export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      orders = _.cloneDeep @props.orders

      if @props.transporter.operationStatus is @props.TRANSPORTERS.OPERATION_STATUS.OUT.VALUE
        orders = []

      # 차량에 의한 필터
      if @props.transporter.vehicleWeightCapacity is @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE
        orders = orders.filter (order) =>
          order.vehicleWeightCapacity is @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE

      else
        orders = orders.filter (order) =>
          order.vehicleWeightCapacity isnt @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE

      # 주문 수신설정에 의한 필터
      deviceId =  deviceInfo.getUniqueID()

      orderFilterConfiguration = @props.transporter.orderFilterConfigurations.find (orderFilterConfiguration) =>
        orderFilterConfiguration.deviceId is deviceId

      if orderFilterConfiguration
        # 거리
        if orderFilterConfiguration.distance isnt -1
          orders = orders.filter (order) =>
            distance = Util.getDistance @props.transporter.currentGeoLocation.longitude, @props.transporter.currentGeoLocation.latitude, order.waypoints.addresses[0].tmap.longitude, order.waypoints.addresses[0].tmap.latitude

            Util.convertMetersToKilos(distance) <= orderFilterConfiguration.distance

      # 아래부터는 헤더의 버튼에 의해서 sort 시키는 코드
      if state.header.ordersSort is 'recent'
        orders = _.sortBy orders, (order) =>
          -order.createdAt.getTime()

      else if state.header.ordersSort is 'distance'
        orders = _.sortBy orders, (order) =>
          distance = Util.getDistance @props.transporter.currentGeoLocation.longitude, @props.transporter.currentGeoLocation.latitude, order.waypoints.addresses[0].tmap.longitude, order.waypoints.addresses[0].tmap.latitude

          distance

      else if state.header.ordersSort is 'fare'
        orders = _.sortBy orders, (order) =>
          -order.agentFare.transporter

      # 헤더 검색
      if state.header.search
        orders = orders.filter (order) =>
          orderString = JSON.stringify order

          regExp = new RegExp state.header.search

          regExp.test orderString

      <WrappedComponent {...@props} orders={orders} />
