import { ScrollView } from 'react-native'

export default observer class _ScrollView extends Component
  # @propTypes:
  #   paddingBottom: PropTypes.number

  @defaultProps:
    paddingBottom: 100

  render: =>
    <ScrollView contentContainerStyle={{ paddingBottom: @props.paddingBottom }} {...@props}>
      { @props.children }
    </ScrollView>
