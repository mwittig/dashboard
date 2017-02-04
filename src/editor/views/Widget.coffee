{crel, div} = require 'teact'
{inject, observer} = require 'mobx-react'

SwitchWidget = require '../../widgets/SwitchWidget'
ButtonWidget = require '../../widgets/ButtonWidget'


Widget = observer(({widget, dashboard, deviceStore, stateStore}) ->
  {devices} = stateStore
  device = if widget.device is '' then 'office-cold' else widget.device
  div id: widget.id, style: dashboard.baseWidgetStyle, className: 'base-widget z-depth-' + dashboard.widgetCardDepth, ->
    if widget.type is 'ButtonWidget'
      crel ButtonWidget, widget: widget, device: devices[widget.device]
    else
      crel SwitchWidget, widget: widget, device: devices[widget.device]

)



module.exports = inject('deviceStore', 'stateStore')(Widget)