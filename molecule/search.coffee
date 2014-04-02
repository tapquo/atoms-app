###
Basic fieldset for search

@namespace Atoms.Molecule
@class Search

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Search extends Atoms.Molecule.Form

  @available: ["Atom.Input", "Atom.Button"]

  @events   : ["change", "submit"]

  @extends  : true

  @default  :
    events  : ["submit"]
    children: [
      "Atom.Input": id: "input", type: "search", placeholder: "Type your search...", events: ["keyup"], required: true
    ,
      "Atom.Button": icon: "search"
    ]

  value: (value) ->
    @input.value value or null

  # Children Bubble Events
  onInputKeyup: (event, atom) =>
    event.preventDefault()
    @bubble "change", event.keyCode
    if event.keyCode is 13 then @_bubbleSubmit event, atom
    false

  onButtonTouch: (event, atom) =>
    event.preventDefault()
    @_bubbleSubmit event, atom
    false

  _bubbleSubmit: (event, atom) ->
    value = @input.value()
    @bubble "submit", event if value isnt ""
