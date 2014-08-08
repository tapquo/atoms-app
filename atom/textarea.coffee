###
@TODO

@namespace Atoms.Atom
@class Textarea

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Textarea extends Atoms.Class.Atom

  @template : """
    <textarea name="{{name}}" {{#if.placeholder}}placeholder="{{placeholder}}"{{/if.placeholder}} {{#if.style}}class="{{style}}"{{/if.style}} {{#required}}required{{/required}} {{#disabled}}disabled{{/disabled}}>{{#if.value}}{{value}}{{/if.value}}</textarea> {{#if.maxlength}}maxlength={{maxlength}}{{/if.maxlength}}"""

  @base     : "Textarea"

  @events   : ["keypress", "keyup", "change"]

  value: (value) ->
    if value? then @el.val value else @el.val()
