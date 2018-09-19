export default withMeta = (WrappedComponent) =>
  observer class WithMeta extends Component
    items = [
      title: '거래처명'
      content: '(주)카고웍스 로지스틱스'
    ,
      title: '주요 출발지'
      content: '서울시 강남구 삼성동 12 섬유센터빌딩'
    ,
      title: '주요 도착지'
      content: '서울시 강남구 삼성동 12 섬유센터빌딩'
    ,
      title: '모집차량'
      content: '오토바이, 다마스, 라보, 1톤탑, 추레라'
    ,
      title: '주요 수행시간'
      content: '14시부터 20시까지'
    ,
      title: '월 퀵주문수'
      content: '20'
    ,
      title: '월 화물주문수'
      content: '20'
    ,
      title: '물품내용'
      content: '고객이 원하는 물품내용이 보여집니다. 고객이 원하는 물품내용이 보여집니다. 고객이 원하는 물품내용이 보여집니다.'
    ,
      title: '유의사항'
      content: '유의사항이 입력됩니다. 유의사항이 입력됩니다. 유의사항이 입력됩니다. 유의사항이 입력됩니다. 유의사항이 입력됩니다. 유의사항이 입력됩니다.'
    ]

    render: =>
      <WrappedComponent {...@props} items={items} />
