import {extendObservable, observable, computed, runInAction, action} from 'mobx'

app_panels =
  settings:
    id: 'settings'
    isShowing: yes
    tab: 'grid'
    openPicker: null
    style:
      backgroundColor:  "rgba(0, 2, 0, 0.85)"
      borderColor: 'black'
      borderWidth: 1
      borderStyle: 'solid'
    initial:
      x: 100
      y: 500
      width: 255
      height: 355
    minWidth: 255
    minHeight: 355
    maxWidth: 400
    maxHeight: 360




class PanelStore
  constructor: (panels) ->
    @component = null
    @components = {}
    extendObservable @, {
      panels: panels
      openPanel: action((id)  -> @panels[id].isShowing = yes)
      openOnlyPanel: action((id)  ->
        runInAction(=>
          @panels[key].isShowing = no for key, panel of @panels when key isnt id
          @panels[id].isShowing = yes
        )
      )
      closePanel: action((id) -> @panels[id].isShowing= no)
      togglePanel: action((id) ->@panels[id].isShowing = !@panels[id].isShowing      )
      enableDrag: action((id) -> @components[id].updateDraggability(yes))
      disableDrag: action((id) ->@components[id].updateDraggability(no))
    }

  setComponent: (id, component) => @components[id] = component


panel = new PanelStore(app_panels)

export default panel