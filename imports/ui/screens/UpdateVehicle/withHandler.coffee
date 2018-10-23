export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      update = (callback) =>
        # WEIGHT만으로는 PARCEL인지 FREIGHT인지 알수 없기 때문에 @props.state.weight가 PARCEL.WEIGHTS에 있으면 PARCEL이고 이 값을 vehicleType에 update한다
        WEIGHT = _.find @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS, (WEIGHT) =>
          WEIGHT.VALUE is @props.state.weight

        if WEIGHT
          vehicleType = @props.TRANSPORTERS.VEHICLES.PARCEL.VALUE

        else
          vehicleType = @props.TRANSPORTERS.VEHICLES.FREIGHT.VALUE

        Meteor.call 'transporters.update',
          _id: @props.user.profile.transporterId
        ,
          $set:
            vehiclePlateNumbers: @props.state.carNumber
            vehicleRegistrationImageUrl: @props.state.carRegisterImageUrl
            vehicleType: vehicleType
            vehicleWeightCapacity: @props.state.weight
            freightBoxType: @props.state.boxType
        , (error) =>
          if error
            Util.alert error.reason

            return

          callback()

      if @props.routeParam?.type is 'update'
        if @props.state.isUpdated
          Util.confirm '정보가 변경되었습니다. 확인을 누르면 관리자가 승인하기 전까지 활동할 수 없으며 대기화면으로 이동합니다. 계속 진행하시겠습니까?', =>
            update =>
              Meteor.call 'transporters.update',
                _id: @props.user.profile.transporterId
              ,
                $set:
                  adminApprovalStatus: @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.UPDATE_REQUESTED.VALUE
              , (error) =>
                if error
                  Util.alert error.reason

                  return

                Util.reset 'Pending'

        else
          Util.back()

      else
        update =>
          # 오토바이이면 UpdateInsurance 나머지는 UpdateInsuranceForOthers로 간다
          if @props.state.weight is @props.TRANSPORTERS.VEHICLES.PARCEL.WEIGHTS.MOTOR_BIKE.VALUE
            Util.go 'UpdateInsurance'

          else
            Util.go 'UpdateInsuranceForOthers'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
