export default withMeta = (WrappedComponent) =>
  observer class WithMeta extends Component
    render: =>
      items = [
        title: '거래처명'
        content: @props.routeParam.recruitment.consignor.name
      ,
        title: '주요 출발지'
        content: @props.routeParam.recruitment.start
      ,
        title: '주요 도착지'
        content: @props.routeParam.recruitment.end
      ,
        title: '모집차량'
        content: @props.routeParam.recruitment.vehicleTexts.join ', '
      ,
        title: '주요 수행시간'
        content: "#{@props.routeParam.recruitment.startWorkHour}시 ~ #{@props.routeParam.recruitment.endWorkHour}시"
      ,
        title: '월 퀵주문수'
        content: @props.routeParam.recruitment.averageParcelOrdersPerMonth
      ,
        title: '월 화물주문수'
        content: @props.routeParam.recruitment.averageFreightOrdersPerMonth
      ,
        title: '물품내용'
        content: @props.routeParam.recruitment.deliveryContent
      ,
        title: '유의사항'
        content: @props.routeParam.recruitment.memo
      ]

      <WrappedComponent {...@props} items={items} />
