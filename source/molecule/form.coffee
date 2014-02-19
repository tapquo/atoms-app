###
Basic fieldset for search

@namespace Atoms.Molecule
@class Form

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Form extends Atoms.Class.Molecule

  @template : """<form {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}style="{{style}}"{{/if.style}}></form>"""

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
    @bubble "submit", event
    false

  onSelectChange: (event, atom) =>
    event.preventDefault()
    @bubble "change", event

  onSwitchChange: (event, atom) =>
    event.preventDefault()
    @bubble "change", event
