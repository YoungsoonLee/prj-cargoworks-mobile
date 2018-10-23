export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
      update = (callback) =>
        if @props.state.value.method is '수신안함'
          method = ''

        else
          method = @props.state.value.method

        modifier =
          $set:
            'withdrawalAccount.bank': @props.state.value.bank
            'withdrawalAccount.accountNumber': @props.state.value.accountNumber
            'withdrawalAccount.holderName': @props.state.value.holderName
            taxationMethod: method
            taxationRegistrationNumber: @props.state.value.number

        if @props.routeParam?.type isnt 'update'
          _.extend modifier.$set,
            adminApprovalStatus: @props.TRANSPORTERS.ADMIN_APPROVAL_STATUS.REQUESTED.VALUE

        Meteor.call 'transporters.update',
          _id: @props.user.profile.transporterId
        , modifier, (error) =>
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
          Util.reset 'Pending'

    render: =>
      <WrappedComponent {...@props} onPressNext={@onPressNext} />
