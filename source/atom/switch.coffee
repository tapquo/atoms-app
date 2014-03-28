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

  @base     : "Switch"

  @events   : ["change"]

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

  onTouch: (event) =>
    @value !(@el.attr "checked")
    @bubble "change", event
