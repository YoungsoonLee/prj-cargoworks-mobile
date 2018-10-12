export default withHandler = (WrappedComponent) =>
  observer class WithHandler extends Component
    onPressDecline: =>
      Util.confirm '거절 하시겠습니까?', =>
        Meteor.call 'invitations.update',
          _id: @props.myAgent.invitationId
        ,
          $set:
            status: 'DECLINED'
        , (error) =>
          if error
            Util.alert error.reason

    onChangeCheckbox: =>
      @props.onChangeCheckbox()

    render: =>
      <WrappedComponent {...@props} onPressDecline={@onPressDecline} onChangeCheckbox={@onChangeCheckbox} />
