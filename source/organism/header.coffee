###
Basic fieldset for search

@namespace Atoms.Organism
@class Header

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Header extends Atoms.Class.Organism

  @template : """<header {{#if.style}}class="{{style}}"{{/if.style}}></header>"""

  @available: ["Atom.Title", "Molecule.Navigation"]

  constructor: ->
    super
    @render()
