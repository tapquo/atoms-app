###
Base for Modals

@namespace Atoms.Molecule
@class Modal

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Modal extends Atoms.Class.Organism

  @template : """<article {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></article>"""

  @available: ["Organism.Header", "Organism.Section", "Organism.Footer"]

  @base     : "Modal"

  @events   : ["active", "inactive"]

  constructor: (attributes = {}) ->
    super attributes
    block_el = Atoms.$(document.createElement("div")).attr "data-system", "modal"
    Atoms.$(@attributes.container or document.body).prepend block_el
    @attributes.container = block_el

    do @render
    for animation_end in Atoms.Core.Constants.ANIMATION.END.split " "
      @el.bind animation_end, @onAnimationEnd
    Atoms.App.Modal[@constructor.name] = @

  # Publics
  show: ->
    @el.parent().addClass "active"
    @el.addClass "show"
    @trigger "show"

  hide: ->
    @el.addClass("hide")
    @trigger "hide"

  # Privates
  onAnimationEnd: =>
    if @el.hasClass "show"
      @el.removeClass "show"
    if @el.hasClass "hide"
      @el.removeClass "hide"
      @el.parent().removeClass "active"
