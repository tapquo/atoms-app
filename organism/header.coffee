###
Basic fieldset for search

@namespace Atoms.Organism
@class Header

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Header extends Atoms.Class.Organism

  @template : """<header {{#if.style}}class="{{style}}"{{/if.style}}></header>"""

  @available: ["Atom.Heading", "Atom.Icon", "Atom.Image", "Atom.Progress", "Molecule.Div", "Molecule.Navigation"]

  @base     : "Header"

  constructor: ->
    super
    @render()

  # Parent Tunnel Events
  onSectionScroll: (event, dispatcher) ->
    @el[(if event.addClass then "addClass" else "removeClass")] "scroll"
    false
