###
@TODO

@namespace Atoms.Atom
@class Input

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Input extends Atoms.Class.Atom

  @template : """
    <input type="{{type}}" name="{{name}}" placeholder="{{placeholder}}" {{#if.style}}class="{{style}}"{{/if.style}} {{#if.value}}value="{{value}}"{{/if.value}} {{#required}}required{{/required}} />"""

  @base : "Input"

  constructor: (attributes) ->
    @default = type: "text"
    super

  value: (value) ->
    if value? then @el.val value else @el.val()

  error: (value) ->
    if value?
      @el.filter("input").addClass "error"
    else
      @el.filter("input").removeClass "error"
