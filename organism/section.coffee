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

  @events   : ["show", "hide"]

  constructor: ->
    super
    do @render

  show: ->
    @el.addClass "active"
    @bubble "show"

  hide: ->
    @el.removeClass "active"
    @bubble "hide"
