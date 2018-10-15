export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressAccept: =>
      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $set:
          agentId: @props.agent._id
      , (error) =>
        if error
          Util.alert error.reason

          return

        Meteor.call 'invitations.update',
          _id: @props.invitation._id
        ,
          $set:
            status: 'ACCEPTED'
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.alert "이제부터 #{@props.agent.name} 소속 기사로 활동합니다."

          Util.back()

    onPressDecline: =>
      Util.confirm '거절하시겠습니까?', =>
        Meteor.call 'invitations.update',
          _id: @props.invitation._id
        ,
          $set:
            status: 'DECLINED'
        , (error) =>
          if error
            Util.alert error.reason

            return

          Util.alert "거절했습니다."

          Util.back()

    render: =>
      <WrappedComponent {...@props} onPressAccept={@onPressAccept} onPressDecline={@onPressDecline} />
