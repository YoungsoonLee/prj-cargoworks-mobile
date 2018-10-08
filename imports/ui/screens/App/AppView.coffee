import '../../../startup/index.coffee'
import StackNavigator from '../../navigators/StackNavigator/StackNavigator.coffee'
import stackNavigation from '../../../etc/stack_navigation.coffee'
import compareVersions from 'compare-versions'
import ForceUpdate from '../../components/ForceUpdate/ForceUpdate.coffee'

export default observer class AppView extends Component
  render: =>
    compare = compareVersions Meteor.settings.version, @props.global.minVersion

    if compare >= 0
      return (
        <StackNavigator ref={(ref) => stackNavigation.setRef ref} />
      )

    else
      return (
        <ForceUpdate />
      )
