export default withValidation = (getItems) =>
  (WrappedComponent) =>
    observer class WithValidation extends Component
      constructor: (props) ->
        super props

        validation =
          isValid: false

        state = _.cloneDeep toJs @props.state

        _.extend validation, state

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
        items = getItems @props

        flags = items.map (item) =>
          validate = @getValidate item.validate

          if item.getError
            _getError = item.getError

          else if item.validate in ['true', 'id', 'password', 'phone number']
            _getError = item.validate

          getError = @getGetError _getError

          value = _get @props.state, item.path

          isValid = validate value

          error = getError value

          # process isValid
          if typeof value is 'string' and item.isRequired and not value
            isValid = false

          _set @state.validation, "#{item.path}.isValid", isValid

          # process error
          if typeof value is 'string' and not value
            error = ''

          _set @state.validation, "#{item.path}.error", error

          isValid

        isAllTrue = _.every flags, Boolean

        @state.validation.isValid = isAllTrue

      getValidate: (validate) =>
        if typeof validate is 'string'
          if validate is 'true'
            return (value) =>
              if not value
                return false

              true

          else if validate is 'id'
            return (value) =>
              if /[^a-z0-9]/.test value
                return false

              if not (6 <= value.length <= 20)
                return false

              true

          else if validate is 'password'
            return (value) =>
              if not /[^a-zA-Z0-9]/.test value
                return false

              if not /[1234567890]/.test value
                return false

              if not /[1234567890]/.test value
                return false

              if value.length < 8
                return false

              true

          else if validate is 'phone number'
            return (value) =>
              if not (10 <= value.length <= 11)
                return false

              true

        else if typeof validate is 'function'
          return validate

        else
          return =>
            true

      getGetError: (getError) =>
        if typeof getError is 'string'
          if getError is 'true'
            return =>
              ''

          else if getError is 'id'
            return (value) =>
              if /[^a-z0-9]/.test value
                return '아이디는 영문 소문자, 숫자만 사용 가능합니다.'

              if not (6 <= value.length <= 20)
                return '아이디는 6~20자만 사용 가능합니다.'

              ''

          else if getError is 'password'
            return (value) =>
              if not /[^a-zA-Z0-9]/.test value
                return '비밀번호는 특수문자를 포함해야 합니다.'

              if not /[1234567890]/.test value
                return '비밀번호는 숫자를 포함해야 합니다.'

              if not /[1234567890]/.test value
                return '비밀번호는 숫자를 포함해야 합니다.'

              if value.length < 8
                return '비밀번호는 8글자 이상으로 해야합니다.'

              ''

          else if getError is 'phone number'
            return (value) =>
              if not (10 <= value.length <= 11)
                return '핸드폰 번호 형식에 맞지 않습니다.'

              ''

        else if typeof getError is 'function'
          return getError

        else
          return =>
            ''

      render: =>
        <WrappedComponent {...@props} validation={@state.validation} />
