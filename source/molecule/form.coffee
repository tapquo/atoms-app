###
Basic fieldset for search

@namespace Atoms.Molecule
@class Form

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Form extends Atoms.Class.Molecule

  @template = """<form {{#if.style}}style="{{style}}"{{/if.style}}></form>"""

  available: ["label", "input", "textarea", "select", "button"]

  constructor: ->
    super

  value: ->
    properties = {}
    properties[input.attributes.name] = input.value() for input in @input
    properties[select.attributes.name] = select.value() for select in @select
    properties

  bubbleInputKeypress: (event, atom) =>
    @bubble "keypress", event.keyCode

  bubbleInputKeyup: (event, atom) =>
    @bubble "keyup", event.keyCode

  bubbleButtonTouch: (event, atom) =>
    event.preventDefault()
    @bubble "submit", event
    false

  bubbleSelectChange: (event, atom) =>
    event.preventDefault()
    @bubble "change", event
