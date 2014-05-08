###
Basic fieldset for search

@namespace Atoms.Molecule
@class Search

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Tags extends Atoms.Molecule.Div

  @extends   : true

  @available: ["Atom.Label"]

  @events   : ["select"]

  # Children Bubble Events
  onLabelSingleTap: (event, atom) =>
    @_bubbleSelect event, atom

  onLabelTap: (event, atom) =>
    @_bubbleSelect event, atom

  _bubbleSelect: (event, atom) ->
    event.preventDefault()
    @bubble "select", atom
    false
