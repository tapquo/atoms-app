###
@TODO

@namespace Atoms.Atom
@class Select

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Select extends Atoms.Class.Atom

  @template = """
    <select name="{{name}}">
      {{#options}}
        <option value="{{value}}" {{#selected}}selected{{/selected}}>{{label}}</option>
      {{/options}}
    </select>
  """

  @base = "Select"
  value: (value) ->
    if value? then @el.val value else @el.val()
