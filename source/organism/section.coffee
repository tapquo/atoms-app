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

  @base : "Section"

  @available: ["Molecule.Form", "Molecule.List",  "Molecule.Navigation", "Atom.Button", "Atom.GMap", "Atom.Heading"]

  constructor: ->
    super
    @render()

  show: -> @trigger "show"

  hide: -> @trigger "hide"
