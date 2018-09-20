import ImageCropPicker from 'react-native-image-crop-picker'
import EvilIcons from 'react-native-vector-icons/EvilIcons'
import { Platform } from 'react-native'

export default observer class ImageUploader extends Component
  # @propTypes:
  #   state: PropTypes.object
  #   path: PropTypes.string
  #   marginTop: PropTypes.number

  @defaultProps:
    state: {}
    path: ''
    marginTop: 0

  constructor: (props) ->
    super props

    @state = observable
      isUploading: false
      url: _get @props.state, @props.path

    reaction(
      =>
        @state.url
    ,
      =>
        _set @props.state, @props.path, @state.url
    )

    reaction(
      =>
        _get @props.state, @props.path
    ,
      =>
        @state.url = _get @props.state, @props.path
    )

  onPressUploadImage: =>
    try
      result = await ImageCropPicker.openPicker
        includeBase64: true

    catch exception
      console.log exception

    @state.isUploading = true

    if Platform.OS is 'android'
      exec = /\/([^/]+)$/.exec result.path

      filename = exec[1]

    else if Platform.OS is 'ios'
      filename = result.filename.trim().replace(/\s/, '')

    Meteor.call 'uploadImage', result.data, filename, (error, url) =>
      if error
        Util.alert error.reason

        return

      @state.url = url

      @state.isUploading = false

  onPressDeletingImage: =>
    @state.url = ''

  render: =>
    if not @state.url and not @state.isUploading
      state = 'blank'

    else if not @state.url and @state.isUploading
      state = 'uploading'

    else if @state.url
      state = 'image'

    if state is 'image'
      exec = /_(.+)/.exec @state.url

      if exec
        filename = exec[1]

      else
        filename = '자동차 등록증.jpg'

    <View style={{ marginTop: @props.marginTop }}>
      <View style={{ height: 44, backgroundColor: '#f3f3f3', borderWidth: 1, borderColor: '#cccccc', justifyContent: 'center', paddingLeft: 10 }}>
        { if state is 'image'
          <Text size={18} bold>{ filename }</Text>
        }
        { if state is 'image' and 1 is 2
          <TouchableWithoutFeedback onPress={@onPressDeletingImage}>
            <View style={{ position: 'absolute', top: 1, right: 3, width: 44, height: 44, justifyContent: 'center', alignItems: 'center' }}>
              <EvilIcons name="close" size={30} />
            </View>
          </TouchableWithoutFeedback>
        }
      </View>
      <Button color="blue" marginTop={10} onPress={@onPressUploadImage}>자동차 등록증 올리기</Button>
    </View>
