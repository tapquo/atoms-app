###
Basic fieldset for search

@namespace Atoms.Molecule
@class Search

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Search extends Atoms.Class.Molecule

  @template : """<fieldset {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></fieldset>"""

  @available: ["Atom.Input", "Atom.Button"]

  @events   : ["change", "enter"]

  @base : "Search"

  constructor: ->
    @default =
      children: [
        "Atom.Input": id: "input", type: "search", placeholder: "Type your search...", events: ["keyup"]
      ,
        "Atom.Button": icon: "Search"
      ]
    super

  value: (value) ->
    if value? then @input.val value else @input.val()

  # Children Bubble Events
  onInputKeyup: (event, atom) =>
    @bubble "change", event.keyCode if "change" in @attributes.events
    if event.keyCode is 13 then @_bubbleSearchEnter event, atom
    false

  onButtonTouch: (event, atom) =>
    @_bubbleSearchEnter event, atom
    false

  _bubbleSearchEnter: (event, atom) ->
    value = @input.value()
    @bubble "enter", event if value isnt "" and "enter" in @attributes.events
