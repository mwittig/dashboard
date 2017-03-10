React = require 'react'
{crel, div, span, text} = require 'teact'
{ observer} = require 'mobx-react'
ColorPicker = require('rc-color-picker')


class ColorPickerComponent  extends React.Component
  handleChange: (colors) =>
    {picker} = @props
    picker.color = colors.color
    picker.alpha = colors.alpha
    return
  render: ->
    {picker, isEditing} = @props
    div className: 'color-picker-row widget-color-picker-row', =>
      text "#{picker.text}"
      crel ColorPickerContainer, picker: picker, onChange: @handleChange, isEditing: isEditing



ColorPickerContainer = observer(({isEditing, picker, onChange}) ->
  className = if !isEditing then 'color-picker-disabled' else ''
  div className: 'color-picker-text', =>
    text "#{picker.color}"
    div style: {margin: '15px 15px 15px', textAlign: 'center'}, className: className, =>
      crel ColorPicker,
        color: picker.color
        alpha: picker.alpha
        mode: 'HSL'
        align:
          points: ['br', 'tl']
          offset: [0, 0]
        onChange: onChange, =>
          span className: 'rc-color-picker-trigger'

)



module.exports = observer(ColorPickerComponent)