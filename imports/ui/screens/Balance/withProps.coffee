export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      if /DEPOSIT/.test @props.balance.transactionType
        type = 'deposite'

      else if @props.balance.transactionType is 'WITHDRAWAL_TO_TRANSPORTER'
        type = 'transporter withdrawal'

      else
        type = 'normal'

      <WrappedComponent {...@props} type={type} />
