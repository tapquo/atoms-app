###
...

@namespace Atoms.Organism
@class Article

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Article extends Atoms.Class.Organism

  @template : """<article {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></article>"""

  @available: ["Organism.Header", "Organism.Section", "Organism.Footer", "Molecule.Navigation", "Molecule.Form"]

  @base     : "Article"

  @events   : ["show", "hide"]

  ACTIVE_STATES = ["in", "back-out", "aside-show", "aside-hide", "aside-show-right", "aside-hide-right"]

  EVENT =
    TUNNEL:
      URL_CHANGE    : "onUrlChange"
      SECTION_SCROLL: "onSectionScroll"

  constructor: (attributes = {}, scaffold) ->
    super attributes, scaffold
    Atoms.App.Article[@constructor.name] = @

  render: ->
    super
    for animation_end in Atoms.Core.Constants.ANIMATION.END.split " "
      @el.bind animation_end, @onAnimationEnd

  state: (state) ->
    if Atoms.Device.screen is "small"
      @el.addClass("active").attr("data-state", state)
    else
      @_trigger state
      if state in ["in", "back-out", "aside-show", "aside-show-right"]
        @el.addClass "active"
      else
        @el.removeClass "active"

  section: (id) ->
    @tunnel EVENT.TUNNEL.URL_CHANGE
    @tunnel EVENT.TUNNEL.SECTION_SCROLL

    for child in @children when child.constructor.base is "Section"
      if child.attributes.id is id
        child.show()
        child.el.focus()
      else if child.el.hasClass "active"
        child.hide()
        child.el.blur()
    @aside() if @el.attr("data-state") is "aside-show"

  aside: (id) =>
    aside_instance = Atoms.App.Aside[id.toClassName()]
    if aside_instance?
      method = if @el.hasClass "aside" then "hide" else "show"
      do aside_instance[method]
      @el.removeClass("aside").removeClass("right") if method is "hide"
      method += "-right" if aside_instance.attributes.style is "right"
      if Atoms.Device.screen is "small"
        @state "aside-#{method}"
      else if method is "show"
        @el.addClass "aside"

      aside_instance.tunnel EVENT.TUNNEL.URL_CHANGE

  back: ->
    @el.addClass "back"

  front: ->
    @el.removeClass "back"

  # Instance Events
  onAnimationEnd: (event) =>
    animation_name = event.animationName or event.originalEvent.animationName
    animation_name = animation_name.split("-")[0]
    if animation_name is "article"
      state = @el.attr "data-state"
      @_trigger state

      unless state in ACTIVE_STATES then @el.removeClass("active")
      if state in ["aside-show", "aside-show-right"]
        @el.addClass "aside"
        @el.addClass "right" if state is "aside-show-right"
      @el.removeAttr "data-state"

  # Children Bubble Events
  onSectionScroll: (event, section) ->
    if event.down and (event.percent > 5 or (event.height - event.scroll) < 128)
      event.addClass = true
    else
      event.addClass = false
    @tunnel "onSectionScroll", event
    false

  _trigger: (state) ->
    if state in ["in", "back-out"]
      @trigger "show"
    else if state in ["out", "back-in"]
      @trigger "hide"
