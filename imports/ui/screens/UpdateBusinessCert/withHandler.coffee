export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressNext: =>
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

        if @props.routeParam?.type is 'update'
          Util.back()

        else
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
          else if result.type is '0'
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
