require './styles.scss'
{ FocusStyleManager } = require '@blueprintjs/core'

T = require 'teact'
ReactDOM = require 'react-dom'
{Provider, useStaticRendering} = require 'mobx-react'
gqlFetch = require('../utils/fetch')('/graphql')
{configureStores} = require './stores'

EditorApp = require './EditorApp'


useStaticRendering(false)
FocusStyleManager.onlyShowFocusOnTabs()


state = JSON.parse(window.__APP_STATE__)
stores = configureStores(state, gqlFetch)

container = document.querySelector('#app')
renderApp = (App) =>
  ReactDOM.render(
    T.crel Provider, stores, =>
      T.crel App, viewStore: stores.viewStore
    , container
  )

renderApp(EditorApp)

