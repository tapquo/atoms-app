###
Basic fieldset for search

@namespace Atoms.Organism
@class Footer

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Footer extends Atoms.Class.Organism

  @template : """<footer {{#if.style}}class="{{style}}"{{/if.style}}></footer>"""

  @available: ["Molecule.Navigation"]

  @base     : "Footer"

  constructor: ->
    super
    @render()
