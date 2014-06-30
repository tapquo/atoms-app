###
@TODO

@namespace Atoms.Atom
@class Switch

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Switch extends Atoms.Class.Atom

  @template : """
    <input type="checkbox" name="{{name}}" {{#if.style}}class="{{style}}"{{/if.style}} {{#required}}required{{/required}} {{#disabled}}disabled{{/disabled}}/>"""

  @base     : "Switch"

  @events   : ["changed"]

  constructor: ->
    super
    @value @attributes.value if @attributes.value?
    event_name = if $$?.isMobile?() then "touchstart" else "change"
    @el.bind event_name, @onTap

  value: (value) ->
    if value is true
      @el.attr "checked", "true"
    else if value is false
      @el.removeAttr "checked"
    else
      @el.attr("checked")?

  onTap: (event) =>
    event.preventDefault()
    event.stopPropagation()
    @value !(@el.attr "checked")
    @bubble "changed", event
