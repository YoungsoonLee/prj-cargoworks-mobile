export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressApply: =>
      transporter = @props.routeParam.recruitment.transporters.find (transporter) =>
        transporter.transporterId is @props.transporter._id

      if transporter
        Util.alert '이미 지원했거나 이미 수행중입니다.'

        return

      Util.confirm '지원하시겠습니까?', =>
        Meteor.call 'recruitments.update',
          _id: @props.routeParam.recruitment._id
        ,
          $push:
            transporters:
              transporterId: @props.transporter._id
              appliedAt: new Date()
              isConnected: false
              connectedAt: new Date()
              connectedByAdminUserId: ''
        , (error) =>
          if error
            Util.alert error.reason

            return

          @props.routeParam.recruitment.transporters.push
            transporterId: @props.transporter._id
            appliedAt: new Date()
            isConnected: false
            connectedAt: new Date()
            connectedByAdminUserId: ''

          Util.alert '지원했습니다.'

    render: =>
      <WrappedComponent {...@props} onPressApply={@onPressApply} />
