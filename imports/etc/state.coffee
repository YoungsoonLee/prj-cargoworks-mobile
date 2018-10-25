export default state = observable
  count: 0
  tab:
    screen: 'Orders'
  verifyPhoneNumberValue:
    name: ''
    phoneNumber: ''
  header:
    isSimpleMode: false
    title: '주문설정'
    isSearchMode: false
    ordersSort: 'recent' # one of 'recent', 'distance', 'fare'
    myOrdersSort: 'in progress' # one of 'in progress', 'today', 'last'
    search: ''
  lazyLoadFlags: [true, false, false, false]
  agent:
    agent: {}
