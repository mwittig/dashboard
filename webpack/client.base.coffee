webpack = require 'webpack'
path = require('path')
paths = require '../config/paths.coffee'

config =
  context: paths.root
  entry:
    blueprint: paths.blueprintCSS
    widgets: path.join paths.widgets, 'widgets.scss'
    global: path.join paths.styles, 'global.scss'

  resolve:
    alias:
      editor: paths.editor + '/'
      widgets: paths.widgets + '/'

    modules: ["node_modules"]
    extensions: ['.js', '.json',  '.jsx', '.coffee', '.css', '.scss']
  module:
    rules: [
      { test: /\.coffee$/, loader: 'coffee-loader', include: paths.src }
      { test: /\.(png|woff|woff2|eot|ttf|svg)$/,  loader: ['url-loader'] }

    ]



module.exports = config