export default state = observable
  count: 0
  verifyPhoneNumberValue:
    name: ''
    phoneNumber: ''
  header:
    isSimpleMode: false
    title: '주문설정'
    isSearchMode: false
    sort: 'recent' # one of 'recent', 'distance', 'fare'
    search: ''
  lazyLoadFlags: [true, false, false, false]
