import React, { Component } from 'react'
import { observer } from 'mobx-react'
import StackNavigator from './ui/navigators/StackNavigator/StackNavigator.coffee'
import stackNavigation from './etc/stack_navigation.coffee'

export default observer class App extends Component
  render: =>
    <StackNavigator ref={(ref) => stackNavigation.setRef ref} />
