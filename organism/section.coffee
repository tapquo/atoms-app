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
               "Atom.Audio", "Atom.Button", "Atom.Figure", "Atom.GMap", "Atom.Heading", "Atom.Icon", "Atom.Image", "Atom.Progress", "Atom.Text", "Atom.Video"]

  @base     : "Section"

  @events   : ["show", "hide", "scroll", "pull"]

  constructor: ->
    super
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
        .removeClass "with-navigation"
        .removeAttr "data-state"
    , 300

  bindScroll: ->
    @current_scroll = 0
    @el.bind "scroll", (event) =>
      down = if event.target.scrollTop > @current_scroll then true else false
      @current_scroll = event.target.scrollTop
      event =
        height : parseInt(event.target.scrollHeight - event.target.getBoundingClientRect().height)
        scroll : event.target.scrollTop
        down   : down
        up     : !down
      event.percent = parseInt((100 * event.scroll) / event.height)
      @bubble "scroll", event

  bindPull: ->
    @pulling = false
    @el.bind "touchstart", (event) =>
      @el.addClass "with-navigation" if @el.offset().top > 60

    @el.bind "swiping", (event) =>
      y = event.quoData.delta.y
      if @el[0].scrollTop < 16 and not @pulling and y > 0
        event.originalEvent.preventDefault()
        y = event.quoData.delta.y
        if y >= 0 and y <= 80
          @el
            .attr "data-state", "pulling"
            .css "position", "relative"
            .css "top", "#{y}px"
          if y > 72
            @pulling = true
            @bubble "pull", event
            @el.attr "data-state", "pull"

    @el.bind "touchend", (event) =>
      @el.css "transition", "top 300ms"
      if @pulling then @el.addClass("loading") else do @refresh
