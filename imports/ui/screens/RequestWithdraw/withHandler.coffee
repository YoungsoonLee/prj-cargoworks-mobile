export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressConfirm: =>
      bankInfo = "#{@props.bank} #{@props.transporter.withdrawalAccount.accountNumber} #{@props.transporter.withdrawalAccount.holderName}"

      Util.confirm "#{bankInfo} 로 충전금 #{Util.getFormattedPrice @props.state.amount}원을 환급 요청합니다.", =>
        Meteor.call 'transporters.deposit.withdrawal.request', @props.transporter._id, @props.state.amount, bankInfo, (error) =>
          if error
            Util.alert error.reason

            return

          Util.back()

          Util.alert '환급 요청을 했습니다.'

    render: =>
      <WrappedComponent {...@props} onPressConfirm={@onPressConfirm} />
