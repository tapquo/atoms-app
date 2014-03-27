###
@TODO

@namespace Atoms.Atom
@class Select

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Select extends Atoms.Class.Atom

  @template : """
    <select name="{{name}}" {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#options}}
        <option value="{{value}}">{{label}}</option>
      {{/options}}
    </select>
  """

  @base     : "Select"

  @events   : ["change"]

  constructor: ->
    super
    @value @attributes.value if @attributes.value?

  value: (value) ->
    if value? then @el.val value else @el.val()
