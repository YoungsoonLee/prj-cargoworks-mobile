export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      update = (callback) =>
        Meteor.call 'transporters.update',
          _id: @props.user.profile.transporterId
        ,
          $set:
            taxType: @props.state.taxType
            regNumber: @props.state.value.regNumber
            regName: @props.state.value.storeName
            ownerName: @props.state.value.name
            address: @props.state.value.address
            contactNumber: @props.state.value.contactNumber
        , (error) =>
          if error
            Util.alert error.reason

            return

          if @props.state.value.taxType is 1
            Meteor.call 'registerPopbillMember', toJs(@props.state.value), @props.user.username, (error) =>
              if error
                Util.alert error.reason

                return

              callback()

          else
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
          Util.go 'UpdateBankAccount'

    onPressCheckRegNumber: =>
      @props.state.isRegNumberChecked = true

      Meteor.call 'checkRegNumber', @props.state.value.regNumber, (error, result) =>
        if not isProduction
          @props.state.isRegNumberValid = true

          @props.state.taxType = 1

          Util.alert '유효한 사업자 등록번호입니다(일반과세자)(디버깅 모드)'

        else
          if error
            @props.state.isRegNumberValid = false

            Util.alert '유효하지 않은 사업자 등록번호입니다'

          # 간이과세자
          else if result.type is '3'
            @props.state.isRegNumberValid = true

            @props.state.taxType = 0

            Util.alert '유효한 사업자 등록번호입니다(간이과세자)'

          # 일반과세자
          else if result.type is '1'
            @props.state.isRegNumberValid = true

            @props.state.taxType = 1

            Util.alert '유효한 사업자 등록번호입니다(일반과세자)'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} onPressCheckRegNumber={@onPressCheckRegNumber} />
