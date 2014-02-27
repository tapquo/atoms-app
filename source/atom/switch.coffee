###
@TODO

@namespace Atoms.Atom
@class Switch

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Switch extends Atoms.Class.Atom

  @template : """
    <input type="checkbox"/>"""

  @base : "Switch"

  constructor: ->
    super
    @value @attributes.value if @attributes.value?
    @el.bind "tap", @onTouch

  value: (value) ->
    if value is true
      @el.attr "checked", "true"
    else if value is false
      @el.removeAttr "checked"
    else
      @el.attr("checked")?

  error: (value) ->
    method = if value? then "addClass" else "removeClass"
    @el[method] "error"

  onTouch: (event) =>
    @value !(@el.attr "checked")
    if "change" in @attributes.events
      @bubble "change", event
