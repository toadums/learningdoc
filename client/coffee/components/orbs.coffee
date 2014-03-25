Orbs = require '/data/orbs'
Orb = require './orb'

module.exports = React.createClass
  displayName: "orbCollection"

  upperWidthBound: 830
  medWidthBound: 500
  gutter: 10


  getInitialState: ->
    orbs: Orbs
    active: 1
    orbSize: @calcOrbSize()

  componentDidMount: ->
    $('#orbs').isotope
      itemSelector: '.orb'
      masonry:
        gutter: @gutter
      getSortData:
        pos: (item) =>
          $item = $(item)
          pos = parseInt($item.data('id'))
          if ($item).hasClass 'expanded'
            if @contentSize() >= @upperWidthBound
              if pos < 5 then 5.5 else Math.min(@state.orbs.length, 4) + 0.5
            else if @medWidthBound <= @contentSize() < @upperWidthBound
              if pos < 4 then 4.5 else Math.min(@state.orbs.length, 3) + 0.5
            else
              if pos < 3 then 3.5 else Math.min(@state.orbs.length, 2) + 0.5
          else
            pos
      sortBy: 'pos'


    $(".orb").bind "transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", () ->
      $("#orbs").isotope('updateSortData').isotope()

    $(window).resize (ev) =>
      @setState orbSize: @calcOrbSize()


  orbClick: (id) ->
    @setState active: id

  contentSize: ->
    min = @upperWidthBound
    width = Math.min window.innerWidth, min

  calcOrbSize: () ->
    width = @contentSize()

    if width >= @upperWidthBound
      (width - @gutter * 5) / 4
    else if @medWidthBound <= width < @upperWidthBound
      (width - @gutter * 4) / 3
    else
      (width - @gutter * 3) / 2


  render: ->
    width = @contentSize()

    topMargin = if width >= @upperWidthBound
      "100px"
    else if @medWidthBound <= width < @upperWidthBound
      "50px"
    else
      "10px"

    order = -1
    React.DOM.ul {id: 'orbs', style: {width: width - 20, "margin-top": topMargin}},
      for orb in @state.orbs
        if @state.active isnt orb.id
          order = (order + 1) % 4
        Orb orb: orb, active: @state.active, orbClick: @orbClick, order: order, size: @state.orbSize
