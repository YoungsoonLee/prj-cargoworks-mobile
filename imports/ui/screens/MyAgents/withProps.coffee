export default withProps = (WrappedComponent) =>
  observer class WithProps extends Component
    render: =>
      myAgents = []

      if @props.agent._id
        myAgents.push
          type: 'agent'
          id: @props.agent._id
          title: @props.agent.name

      invitations = _.cloneDeep @props.invitations

      invitations.forEach (invitation) =>
        agent = @props.agents.find (agent) =>
          agent._id = invitation.inviterPersonnel.agentId

        invitation.agent = agent

      _myAgents = invitations.map (invitation) =>
        type: 'invitation'
        id: invitation.inviterPersonnel.agentId
        invitationId: invitation._id
        title: invitation.agent.name

      myAgents = myAgents.concat _myAgents

      myAgents.push
        type: 'indivisual'
        id: 'indivisual'
        title: '개인 기사로 활동'

      <WrappedComponent {...@props} myAgents={myAgents} />
