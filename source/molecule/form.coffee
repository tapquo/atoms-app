###
Basic fieldset for search

@namespace Atoms.Molecule
@class Form

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Form extends Atoms.Class.Molecule

  @template : """<form {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></form>"""

  @available: ["Atom.Label", "Atom.Input", "Atom.Textarea", "Atom.Select", "Atom.Switch", "Atom.Button"]

  @base : "Form"

  constructor: ->
    super

  value: ->
    properties = {}
    for child in @children when child.value?
      properties[child.attributes.name] = child.value()
    properties

  onInputKeypress: (event, atom) =>
    @bubble "keypress", event

  onInputKeyup: (event, atom) =>
    @bubble "keyup", event

  onButtonTouch: (event, atom) =>
    event.preventDefault()
    required = true
    for child in @children when child.value?
      if child.attributes.required and not child.value()
        child.el.addClass "error"
        required = false
      else
        child.el.removeClass "error"
    @bubble "submit", event if required
    false

  onSelectChange: (event, atom) =>
    event.preventDefault()
    @bubble "change", event

  onSwitchChange: (event, atom) =>
    event.preventDefault()
    @bubble "change", event
