###
Base for Dialogs

@namespace Atoms.Molecule
@class Dialog

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Dialog extends Atoms.Class.Organism

  @template : """<article {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></article>"""

  @available: ["Organism.Header", "Molecule.Navigation", "Organism.Section", "Organism.Footer"]

  @base     : "Dialog"

  @events   : ["show", "hide"]

  constructor: (attributes = {}, scaffold) ->
    super attributes, scaffold
    block_el = Atoms.$(document.createElement("div")).attr "data-system", "dialog"
    Atoms.$(@attributes.container or document.body).prepend block_el
    @attributes.container = block_el
    Atoms.App.Dialog[@attributes.id?.toClassName() or @constructor.name] = @

    do @render
    for animation_end in __.Constants.ANIMATION.END.split " "
      @el.bind animation_end, @onAnimationEnd

  # Publics
  show: ->
    @el.parent().addClass "active"
    @el.addClass "show"
    @trigger "show"
    #@TODO: Hack for Firefox AnimationEnd listener fails
    setTimeout (=> do @onAnimationEnd), __.Constants.ANIMATION.DURATION
    __.Url.current()?.back()

  hide: ->
    @el.addClass "hide"
    @trigger "hide"
    __.Url.current()?.front()

  # Privates
  onAnimationEnd: =>
    if @el.hasClass "show"
      @el.removeClass "show"
    if @el.hasClass "hide"
      @el.removeClass "hide"
      @el.parent().removeClass "active"
