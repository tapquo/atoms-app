###
Basic fieldset for search

@namespace Atoms.Organism
@class Section

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Section extends Atoms.Class.Organism

  @template : """
    <section {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></section>
  """

  @available: ["Molecule.Div", "Molecule.Form", "Molecule.List",  "Molecule.Navigation", "Molecule.Tags",
               "Atom.Audio", "Atom.Button", "Atom.Figure", "Atom.GMap", "Atom.Heading", "Atom.Icon", "Atom.Iframe", "Atom.Image", "Atom.Leaflet", "Atom.Progress", "Atom.Text", "Atom.Video"]

  @base     : "Section"

  @events   : ["show", "hide", "scroll", "pull"]

  constructor: (attributes = {}, scaffold) ->
    super attributes, scaffold
    do @render

  render: ->
    super
    do @bindScroll if "scroll" in (@attributes.events or [])
    do @bindPull if "pull" in (@attributes.events or [])

  show: ->
    @el.addClass "active"
    @bubble "show"

  hide: ->
    @el.removeClass "active"
    @bubble "hide"

  refresh: ->
    @pulling = false
    @el
      .removeAttr "data-state=pull"
      .css "top", "0px"
    setTimeout =>
      @el
        .removeAttr "style"
        .removeClass "loading"
        .removeAttr "data-state"
    , 300

  bindScroll: ->
    @current_scroll = 0
    @el.bind "scroll", @_scrollEvent
    @el.bind "touchcancel", @_scrollEvent

  bindPull: ->
    @pulling = false
    @el.bind "touchstart", (event) =>
      @el.attr "data-pull", parseInt(@el.offset().top)

    @el.bind "swiping", (event) =>
      y = event.touch.delta.y
      if @el[0].scrollTop < 16 and not @pulling and y > 0
        event.originalEvent.preventDefault()
        y = event.touch.delta.y
        if y >= 0 and y <= 80
          @el
            .attr "data-state", "pulling"
            .css "top", "#{y}px"
          if y > 72
            @pulling = true
            @bubble "pull", event
            @el.attr "data-state", "pull"

    @el.bind "touchend", (event) =>
      @el.css "transition", "top 300ms"
      if @pulling then @el.addClass("loading") else do @refresh

  _scrollEvent: (event) =>
    now = new Date()
    if (now - (@previous_gesture or 0)) > 100
      @previous_gesture = now
      down = if event.target.scrollTop > @current_scroll then true else false
      @current_scroll = event.target.scrollTop
      event =
        height : parseInt(event.target.scrollHeight - event.target.getBoundingClientRect().height)
        scroll : event.target.scrollTop
        down   : down
        up     : !down
      event.percent = parseInt((100 * event.scroll) / event.height)
      @bubble "scroll", event
