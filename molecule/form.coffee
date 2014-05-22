###
Form

@namespace Atoms.Molecule
@class Form

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Form extends Atoms.Class.Molecule

  @template : """<form {{#if.style}}class="{{style}}"{{/if.style}}></form>"""

  @available: ["Atom.Label", "Atom.Input", "Atom.Textarea", "Atom.Select", "Atom.Switch", "Atom.Button"]

  @events   : ["change", "submit", "error"]

  @base     : "Form"

  @default  :
    events: ["submit"]

  constructor: ->
    super
    @el.bind "submit", (event) -> event.preventDefault()

  value: ->
    properties = {}
    for child in @children when child.attributes.name and child.value?
      properties[child.attributes.name.toLowerCase()] = child.value()
    properties

  clean: ->
    child.value "" for child in @children when child.attributes.name and child.value?
    true

  # Children Bubble Events
  onInputKeypress: (event, atom) =>
    @_bubbleChange event, atom

  onInputKeyup: (event, atom) =>
    @_bubbleChange event, atom

  onSelectChange: (event, atom) =>
    @_bubbleChange event, atom

  onSwitchChanged: (event, atom) =>
    @_bubbleChange event, atom

  onButtonTouch: (event, atom) =>
    event.preventDefault()
    required = true
    for child in @children when child.value?
      if child.attributes.required and not child.value()
        child.el.addClass "error"
        required = false
      else
        child.el.removeClass "error"

    method = if required then "submit" else "error"
    @bubble method, event
    false

  _bubbleChange: (event, atom) ->
    event.preventDefault()
    if atom.attributes.required and not atom.value()
      atom.el.addClass "error"
    else
      atom.el.removeClass "error"
    @bubble "change", event
    false
