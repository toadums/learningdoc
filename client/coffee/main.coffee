Orbs = require '/coffee/components/orbs'

module.exports = React.createClass
  displayName: "main_container"

  render: ->
    React.DOM.section {id: "content"},
      Orbs()
