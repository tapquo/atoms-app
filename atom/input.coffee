###
@TODO

@namespace Atoms.Atom
@class Input

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Input extends Atoms.Class.Atom

  @template : """
    <input type="{{type}}" name="{{name}}" {{#if.placeholder}}placeholder="{{placeholder}}"{{/if.placeholder}} {{#if.style}}class="{{style}}"{{/if.style}} {{#if.value}}value="{{value}}"{{/if.value}} {{#required}}required{{/required}} {{#disabled}}disabled{{/disabled}} {{#if.maxlength}}maxlength={{maxlength}}{{/if.maxlength}} {{#if.checked}}checked{{/if.checked}} />"""

  @base     : "Input"

  @events   : ["keypress", "keyup", "change"]

  @default  :
    type: "text"

  value: (value) ->
    if @attributes.type is "checkbox"
      if value? then @el[0].checked = value else @el[0].checked
    else
      if value? then @el.val value else @el.val()

  clean: ->
    @value ""

  error: (value, focus = true) ->
    method = "removeClass"
    if value
      method = "addClass"
      @el[0].focus() if focus
    @el[method] "error"
