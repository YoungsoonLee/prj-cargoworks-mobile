export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      balances = _.cloneDeep @props.balances

      requestedBalances = balances.filter (balance) =>
        balance.transactionStatus is 'REQUESTED'

      requestedWithdraw = requestedBalances.reduce (sum, requestedBalance) =>
        sum + requestedBalance.amount
      , 0

      balances = balances.filter (balance) =>
        @props.state.startAt.format('YYYY-MM-DD') <= moment(balance.createdAt).format('YYYY-MM-DD') <= @props.state.endAt.format('YYYY-MM-DD')

      withdrawal = balances.reduce (sum, balance) =>
        if /FEE|WITHDRAWAL/.test balance.transactionType
          return sum + balance.amount

        else
          return sum
      , 0

      deposite = balances.reduce (sum, balance) =>
        if not /FEE|WITHDRAWAL/.test balance.transactionType
          return sum + balance.amount

        else
          return sum
      , 0

      <WrappedComponent {...@props} balances={balances} withdrawal={withdrawal} deposite={deposite} requestedWithdraw={requestedWithdraw} />
