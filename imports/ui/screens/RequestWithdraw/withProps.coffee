export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      bank = @props.ACCOUNTS.BANKS[@props.transporter.withdrawalAccount.bank].TEXT

      minDeposite = parseInt @props.global.transporterMinDeposit.replace ',', ''

      if (@props.transporter.deposit - minDeposite) >= 0
        availableWithdraw = @props.transporter.deposit - minDeposite

      else
        availableWithdraw = 0

      <WrappedComponent {...@props} bank={bank} minDeposite={minDeposite} availableWithdraw={availableWithdraw} />
