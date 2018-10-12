export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressSave: =>
      if @props.state.checkedMyAgent.type is 'indivisual'
        modifier =
          agentId: ''

      else
        modifier =
          agentId: @props.state.checkedMyAgent.id

      Meteor.call 'transporters.update',
        _id: @props.transporter._id
      ,
        $set: modifier
      , (error) =>
        if error
          Util.alert error.reason

          return

        if @props.state.checkedMyAgent.type is 'invitation'
          Meteor.call 'invitations.update',
            _id: @props.state.checkedMyAgent.invitationId
          ,
            $set:
              status: 'ACCEPTED'
          , (error) =>
            if error
              Util.alert error.reason

              return

            Util.alert '저장되었습니다.'

            Util.back()

        else
          Util.alert '저장되었습니다.'

          Util.back()

    onChangeCheckbox: (myAgent) =>
      @props.state.checkedMyAgent = myAgent

    render: =>
      <WrappedComponent {...@props} onPressSave={@onPressSave} onChangeCheckbox={@onChangeCheckbox} />
