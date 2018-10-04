export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressPublish: (total) =>
      if @props.state.method is '사업자 번호'
        publishNumber = @props.state.regNumber

      else if @props.state.method is '핸드폰 번호'
        publishNumber = @props.state.phoneNumber

      else if @props.state.method is '현금카드번호'
        publishNumber = @props.state.cardNumber

      Meteor.call 'publishCashBill', @props.transporter.regNumber, publishNumber, total, (error) =>
        if error
          Util.alert error.reason

          return

        Meteor.call 'orders.update',
          _id: @props.order._id
        ,
          $set:
            isCashBillPublished: true
            cashBillPublishedAt: new Date()
            method: @props.state.method
            publishNumber: publishNumber
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.back()

          Util.alert '현금 영수증을 발행했습니다.'

    render: =>
      <WrappedComponent {...@props} onPressPublish={@onPressPublish} />
