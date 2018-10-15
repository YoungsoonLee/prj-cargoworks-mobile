export default withMeta = (WrappedComponent) =>
  observer class WithMeta extends Component
    render: =>
      if @props.type is 'deposite'
        details = [
          title: '입금자'
          content: @props.agent.name
        ,
          title: '입금일시'
          content: moment(@props.balance.createdAt).format('YY/MM/DD HH:mm')
        ,
          title: '사유'
          content: @props.balance.reason
        ]

      else if @props.type is 'transporter withdrawal'
        details = [
          title: '신청일시'
          content: moment(@props.balance.createdAt).format('YY/MM/DD HH:mm')
        ,
          title: '환급일시'
          content: '-'
        ,
          title: '신청계좌'
          content: @props.balance.bankInfo
        ]

      else if @props.type is 'normal'
        details = []

      else
        details = []

      <WrappedComponent {...@props} details={details} />
