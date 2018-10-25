import { StackActions, NavigationActions } from 'react-navigation'

stackNavigationRef = null

setRef = (ref) =>
  stackNavigationRef = ref

navigate = (routeName, param) =>
  action = NavigationActions.navigate
    routeName: routeName
    params: param

  stackNavigationRef.dispatch action

back = () =>
  action = NavigationActions.back()

  stackNavigationRef.dispatch action

reset = (routeName, param) =>
  action = StackActions.reset
    index: 0
    actions: [
      NavigationActions.navigate
        routeName: routeName
        params: param
    ]

  stackNavigationRef.dispatch action

replace = (routeName, param) =>
  action = StackActions.replace
    index: 0
    actions: [
      NavigationActions.navigate
        routeName: routeName
        params: param
    ]

  stackNavigationRef.dispatch action


export default
  setRef: setRef
  navigate: navigate
  back: back
  reset: reset
  replace: replace
