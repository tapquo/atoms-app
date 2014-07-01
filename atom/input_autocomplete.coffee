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
      <datalist for="{{name}}"></datalist>
    </fieldset>"""

  @events   : ["change", "select"]

  constructor: ->
    super
    do @_managePseudoElements

  refresh: ->
    super
    do @_managePseudoElements

  value: (value) ->
    if value?
      @el.val value
    else
      value = @el.val()
      for option in @attributes.options or [] when option.label is value
        value = option.value
        break
      value

  _managePseudoElements: ->
    @datalist = @el.find "datalist"
    @el = @el.find "input"
    @el.bind "keyup", @_bindKeyup
    @datalist.bind "touchstart", @_bindTouch

    if @attributes.options?.length > 0
      options = []
      for option in @attributes.options or []
        options.push if option.value? then option else {value: option, label: option}
      @attributes.options = options

  _bindKeyup: (event) =>
    @datalist.removeClass "active"
    value = @el.val().toLowerCase()
    clearTimeout @timer if @timer?
    if value
      markup = ""
      for option in @attributes.options when option.label.toLowerCase().match(value)?.index is 0
        markup += """<li value="#{option.value}">#{option.label}</li>"""
      if markup isnt ""
        @datalist.html markup
        @datalist.addClass "active"
        @timer = setTimeout (=> do @_hide), 3000
    @bubble "change" if "change" in (@attributes.events or [])

  _bindTouch: (event) =>
    @value Atoms.$(event.target).html()
    do @_hide
    @bubble "select" if "select" in (@attributes.events or [])

  _hide: =>
    @datalist.removeClass "active" if @datalist.hasClass "active"
