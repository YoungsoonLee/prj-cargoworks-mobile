import { NavigationActions } from 'react-navigation'

tabNavigationRef = null

setRef = (ref) =>
  tabNavigationRef = ref

navigate = (routeName, param) =>
  action = NavigationActions.navigate
    routeName: routeName
    params: param

  tabNavigationRef.dispatch action

export default
  setRef: setRef
  navigate: navigate
