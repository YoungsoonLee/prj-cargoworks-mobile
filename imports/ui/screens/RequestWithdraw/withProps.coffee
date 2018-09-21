export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      bank = @props.ACCOUNTS.BANKS[@props.transporter.withdrawalAccount.bank].TEXT

      minDeposite = parseInt @props.global.transporterMinDeposit.replace ',', ''

      if @props.transporter.deposite - minDeposite >=0
        availableWithdraw = @props.transporter.deposite - minDeposite

      else
        availableWithdraw = 0

      <WrappedComponent {...@props} bank={bank} minDeposite={minDeposite} availableWithdraw={availableWithdraw} />
