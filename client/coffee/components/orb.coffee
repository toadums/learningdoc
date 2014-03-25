module.exports = React.createClass
  displayName: "orb"

  onClick: (ev) ->
    @props.orbClick $(ev.target).closest('li').data('id')

  render: ->
    expanded = @props.orb.id is @props.active
    className = 'orb'
    className += ' expanded' if expanded
    className += " order#{@props.order}" if @props.order?
    style = if expanded then {} else {width: @props.size, height: @props.size}
    
    React.DOM.li {className: className, onClick: @onClick, "data-id": @props.orb.id, "data-pos": @props.pos, style: style},
      React.DOM.h1 {}, @props.orb.header
      part for part in @props.orb.content
