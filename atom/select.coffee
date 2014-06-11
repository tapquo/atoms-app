###
@TODO

@namespace Atoms.Atom
@class Select

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Select extends Atoms.Class.Atom

  @template : """
    <select name="{{name}}" {{#if.style}}class="{{style}}"{{/if.style}} {{#required}}required{{/required}} {{#disabled}}disabled{{/disabled}}>
      {{#options}}
        <option value="{{value}}">{{label}}</option>
      {{/options}}
    </select>
  """

  @base     : "Select"

  @events   : ["change"]

  constructor: (attributes = {}) ->
    if attributes.options?.length > 0
      options = []
      for option in attributes.options
        options.push if option.value then option else {value: option, label: option}
      attributes.options = options
    super attributes
    @value @attributes.value if @attributes.value?

  value: (value) ->
    if value? then @el.val value else @el.val()
