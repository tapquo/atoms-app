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

  @available: ["Molecule.Form", "Molecule.List",  "Molecule.Navigation", "Atom.Button", "Atom.GMap", "Atom.Heading", "Atom.Figure", "Atom.Icon", "Atom.Image"]

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
