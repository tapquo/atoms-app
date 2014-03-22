###
@TODO

@namespace Atoms.Atom
@class Input

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Input extends Atoms.Class.Atom

  @template : """
    <input type="{{type}}" name="{{name}}" placeholder="{{placeholder}}" {{#if.style}}class="{{style}}"{{/if.style}} {{#if.value}}value="{{value}}"{{/if.value}} {{#required}}required{{/required}} {{#disabled}}disabled{{/disabled}} />"""

  @base : "Input"

  constructor: ->
    @default =
      type: "text"
    super

  value: (value) ->
    if value? then @el.val value else @el.val()
