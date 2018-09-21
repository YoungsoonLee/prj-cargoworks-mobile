export default withFilter = (WrappedComponent) =>
  observer class WithFilter extends Component
    render: =>
      faqs = _.cloneDeep @props.faqs

      if @props.state.search
        regExp = new RegExp @props.state.search

        faqs = faqs.filter (faq) =>
          regExp.test(faq.title) or regExp.test(faq.content)

      <WrappedComponent {...@props} faqs={faqs} />
