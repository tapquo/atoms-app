###
Base for Modals

@namespace Atoms.Molecule
@class Modal

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Modal extends Atoms.Class.Organism

  @template : """<article {{#if.style}}class="{{style}}"{{/if.style}}></article>"""

  @available: ["Organism.Header", "Organism.Section", "Organism.Footer"]

  @base     : "Modal"

  constructor: (@attributes={}) ->
    super @attributes

    container = Atoms.$(document.createElement("div")).data "system", "modal"
    Atoms.$(document.body).append container
    @attributes.container = container

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
    @el.removeClass("show").addClass("hide")
    @trigger "hide"

  # Privates
  onAnimationEnd: =>
    if @el.hasClass "hide"
      @el.parent().removeClass "active"
      @el.removeClass "hide"
