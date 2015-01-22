###
Form

@namespace Atoms.Molecule
@class Form

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Form extends Atoms.Class.Molecule

  @template : """<form {{#if.style}}class="{{style}}"{{/if.style}}></form>"""

  @available: ["Atom.Button", "Atom.Input", "Atom.Label", "Atom.Progress",
               "Atom.Select", "Atom.Switch", "Atom.Textarea"]

  @events   : ["change", "submit", "error"]

  @base     : "Form"

  @default  :
    events: ["submit"]

  constructor: ->
    super
    @el.bind "submit", (event) -> event.preventDefault()

  value: (values) ->
    if values
      for child in @children when child.attributes.name and child.value?
        child.value values[child.attributes.name] if values[child.attributes.name]
    else
      values = {}
      for child in @children when child.attributes.name and child.value?
        values[child.attributes.name.toLowerCase()] = child.value()
    values

  clean: ->
    for child in @children when child.attributes.name and child.value?
      if child.constructor.name is "Switch"
        child.value false
      else
        child.clean()

  # -- Children Bubble Events --------------------------------------------------
  onInputKeypress: (event, atom) -> @_bubbleChange event, atom

  onInputKeyup: (event, atom) -> @_bubbleChange event, atom

  onInputChange: (event, atom) -> @_bubbleChange event, atom

  onTextareaKeypress: (event, atom) -> @_bubbleChange event, atom

  onTextareaKeyup: (event, atom) -> @_bubbleChange event, atom

  onTextareaChange: (event, atom) -> @_bubbleChange event, atom

  onSelectChange: (event, atom) -> @_bubbleChange event, atom

  onSwitchChanged: (event, atom) -> @_bubbleChange event, atom

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
      @bubble "error", event
    else
      atom.el.removeClass "error"
      @bubble "complete", event
    @bubble "change", event
    false
