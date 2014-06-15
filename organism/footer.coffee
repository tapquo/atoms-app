###
Basic fieldset for search

@namespace Atoms.Organism
@class Footer

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Footer extends Atoms.Class.Organism

  @template : """<footer {{#if.style}}class="{{style}}"{{/if.style}}></footer>"""

  @available: ["Atom.Progress", "Molecule.Navigation"]

  @base     : "Footer"

  constructor: ->
    super
    @render()

  # Parent Tunnel Events
  onSectionScroll: (event, dispatcher) ->
    @el[(if event.addClass then "addClass" else "removeClass")] "scroll"
    false
