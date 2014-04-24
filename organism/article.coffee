###
...

@namespace Atoms.Organism
@class Article

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Article extends Atoms.Class.Organism

  @template : """<article {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></article>"""

  @available: ["Organism.Header", "Organism.Section", "Organism.Footer", "Molecule.Navigation"]

  @base     : "Article"

  @events   : ["show", "hide"]

  constructor: ->
    super
    Atoms.App.Article[@constructor.name] = @

  render: ->
    super
    for animation_end in Atoms.Core.Constants.ANIMATION.END.split " "
      @el.bind animation_end, @onAnimationEnd

  state: (name) ->
    @el.addClass("active").attr("data-state", name)

  section: (id) ->
    @tunnel "navigation", @

    for child in @children when child.constructor.base is "Section"
      if child.attributes.id is id
        child.show()
        child.el.focus()
      else if child.el.hasClass "active"
        child.hide()
        child.el.blur()

    @aside() if @el.attr("data-state") is "aside-show"

  aside: (id) ->
    if Atoms.App.Aside[id.toClassName()]?
      method = if @el.hasClass "aside" then "hide" else "show"
      do Atoms.App.Aside[id.toClassName()][method]
      if method is "hide" then @el.removeClass "aside"
      @state "aside-#{method}"

  onAnimationEnd: (event) =>
    state = @el.attr "data-state"
    if state in ["in", "back-out"]
      @trigger "show"
    else if state in ["out", "back-in"]
      @trigger "hide"

    unless state in ["in", "back-out", "aside-show", "aside-hide"] then @el.removeClass("active")
    if state is "aside-show" then @el.addClass "aside"

    @el.removeAttr "data-state"
