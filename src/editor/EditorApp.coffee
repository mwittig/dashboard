{inject, observer} = require 'mobx-react'
{crel} = require 'teact'
EditorPage = require './views/EditorPage'
SetupPage = require './views/SetupPage'

EditorApp = observer(({viewStore}) =>
  switch viewStore.currentPageView
    when 'SetupPage' then return crel SetupPage
    when 'EditorPage' then return crel EditorPage

)


module.exports = inject('viewStore')(EditorApp)