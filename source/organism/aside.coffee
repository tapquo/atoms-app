###
...

@namespace Atoms.Organism
@class Aside

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Aside extends Atoms.Class.Organism

  @template : """<aside {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></aside>"""

  @available: ["Organism.Header", "Organism.Section", "Organism.Footer"]

  @base : "Aside"

  constructor: (attributes = {})->
    attributes.method = "prepend"
    super attributes
    Atoms.App.Aside[@constructor.name] = @

  render: ->
    super
    for animation_end in Atoms.Core.Constants.ANIMATION.END.split " "
      @el.bind animation_end, @onAnimationEnd

  in: ->
    unless @el then @render()
    @el.addClass "active"
    @el.attr "data-state", "in"

  out: ->
    if @el?.hasClass "active" then @el.attr "data-state", "out"

  onAnimationEnd: (event) =>
    state = @el.attr "data-state"
    @trigger state
    @el.removeAttr "data-state"
    @el.removeClass "active" if state is "out"
