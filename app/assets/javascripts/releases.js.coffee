jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#release_avatar_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 200, 200]
      minSize: [300,300]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#release_avatar_crop_x').val(coords.x)
    $('#release_avatar_crop_y').val(coords.y)
    $('#release_avatar_crop_w').val(coords.w)
    $('#release_avatar_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#release_avatar_previewbox').css
      width: Math.round(100/coords.w * $('#release_avatar_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#release_avatar_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
