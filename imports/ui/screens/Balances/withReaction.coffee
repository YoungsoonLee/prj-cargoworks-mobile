export default withreaction = (WrappedComponent) =>
  observer class Withreaction extends Component
    constructor: (props) ->
      super props

      reaction(
        =>
          @props.state.filter
      ,
        =>
          if @props.state.filter is '오늘'
            @props.state.startAt = moment()
            @props.state.endAt = moment()

          else if @props.state.filter is '1주'
            @props.state.startAt = moment().subtract(1, 'weeks')
            @props.state.endAt = moment()

          else if @props.state.filter is '1개월'
            @props.state.startAt = moment().subtract(1, 'months')
            @props.state.endAt = moment()

          else if @props.state.filter is '3개월'
            @props.state.startAt = moment().subtract(3, 'months')
            @props.state.endAt = moment()
      )


    render: =>
      <WrappedComponent {...@props} />
