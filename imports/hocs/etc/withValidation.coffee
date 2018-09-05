export default withValidation = (getItems) =>
  (WrappedComponent) =>
    observer class WithValidation extends Component
      constructor: (props) ->
        super props

        validation =
          isValid: false

        _.extend validation, @props.state

        items = getItems @props

        items.forEach (item) =>
          eval """
            validation.#{item.path} = {
              isValid: false,
              error: ''
            }
          """

        @state = observable
          validation: validation

        @validate()

        @forceUpdate()

        reaction(
          =>
            toJs @props.state
        ,
          =>
            @validate()

            @forceUpdate()
        )

      validate: =>
        state = @props.state

        validation = @state.validation

        items = getItems @props

        flags = items.map (item) =>
          value = ''

          eval "value = state.#{item.path}"

          isValid = false

          error = ''

          if value or typeof value is 'boolean'
            validate = @getValidate item.validate

            eval "error = validate(value)"

            if error
              isValid = false

            else
              isValid = true

          else
            if item.isRequired
              isValid = false

            else
              isValid = true

          eval "validation.#{item.path}.isValid = isValid"

          eval "validation.#{item.path}.error = error"

          isValid

        isAllTrue = _.every flags, Boolean

        @state.validation.isValid = isAllTrue

      getValidate: (validate) =>
        if typeof validate is 'string'
          if validate is 'true'
            return (value) =>
              if not value
                return 'false'

              ''

          else if validate is 'id'
            return (value) =>
              if not value
                return ''

              if /[^a-z0-9]/.test value
                return '아이디는 영문 소문자, 숫자만 사용 가능합니다.'

              if not (6 <= value.length <= 20)
                return '아이디는 6~20자만 사용 가능합니다.'

              ''

          else if validate is 'password'
            return (value) =>
              if not value
                return ''

              if not /[^a-zA-Z0-9]/.test value
                return '비밀번호는 특수문자를 포함해야 합니다.'

              if not /[1234567890]/.test value
                return '비밀번호는 숫자를 포함해야 합니다.'

              if not /[1234567890]/.test value
                return '비밀번호는 숫자를 포함해야 합니다.'

              if value.length < 8
                return '비밀번호는 8글자 이상으로 해야합니다.'

              ''

          else if validate is 'phone number'
            return (value) =>
              if not value
                return ''

              if not (10 <= value.length <= 11)
                return '핸드폰 번호 형식에 맞지 않습니다.'

              ''

        else if typeof validate is 'function'
          return validate

        else
          return () =>
            ''

      render: =>
        <WrappedComponent {...@props} validation={@state.validation} />
