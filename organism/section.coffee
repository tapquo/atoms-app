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

  @available: ["Molecule.Div", "Molecule.Form", "Molecule.List",  "Molecule.Navigation",
               "Atom.Audio", "Atom.Figure", "Atom.Button", "Atom.GMap", "Atom.Heading", "Atom.Icon", "Atom.Image", "Atom.Video"]

  @base     : "Section"

  @events   : ["show", "hide", "scroll"]

  constructor: ->
    super
    do @render

  render: ->
    super
    do @bindScroll if "scroll" in @attributes.events or []

  show: ->
    @el.addClass "active"
    @bubble "show"

  hide: ->
    @el.removeClass "active"
    @bubble "hide"

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
