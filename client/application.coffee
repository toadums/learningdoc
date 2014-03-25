Main = require 'coffee/main'

# The application object.
module.exports = class Application
  @init: ->
    React.renderComponent Main(), $( 'body').get(0)
