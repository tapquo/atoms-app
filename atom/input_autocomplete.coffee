###
@TODO

@namespace Atoms.Molecule
@class AutoComplete

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.AutoComplete extends Atoms.Atom.Input

  @extends  : true

  @template : """
    <fieldset>
      <input type="text" name="{{name}}" {{#if.placeholder}}placeholder="{{placeholder}}"{{/if.placeholder}} {{#if.style}}class="{{style}}"{{/if.style}} {{#if.value}}value="{{value}}"{{/if.value}} {{#required}}required{{/required}} {{#disabled}}disabled{{/disabled}} {{#if.maxlength}}maxlength={{maxlength}}{{/if.maxlength}} />
      <datalist>
        {{#options}}<li value="{{.}}">{{.}}</li>{{/options}}
      </datalist>
    </fieldset>"""

  constructor: ->
    super
    @datalist = @el.find "datalist"
    @el = @el.find "input"

    @el.bind "keyup", @_bindKeyup
    @datalist.bind "touchstart", @_bindTouch

  _bindKeyup: (event) =>
    @datalist.removeClass "active"
    value = @value()
    clearTimeout @timer if @timer?
    if value
      markup = ""
      for option in @attributes.options when option.match(value)?.index is 0
        markup += "<li>#{option}</li>"
      if markup isnt ""
        @datalist.html markup
        @datalist.addClass "active"
        @timer = setTimeout (=> do @_hide), 3000

  _bindTouch: (event) =>
    @value Atoms.$(event.target).html()
    do @_hide

  _hide: =>
    @datalist.removeClass "active" if @datalist.hasClass "active"
