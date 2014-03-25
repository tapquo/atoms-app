###
...

@namespace Atoms.Organism
@class Article

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Article extends Atoms.Class.Organism

  @template : """<article {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></article>"""

  @available : ["Organism.Header", "Organism.Section", "Organism.Footer", "Molecule.Navigation"]

  @base : "Article"

  constructor: ->
    super
    Atoms.App.Article[@constructor.name] = @

  render: ->
    super
    for animation_end in Atoms.Core.Constants.ANIMATION.END.split " "
      @el.bind animation_end, @onAnimationEnd

  in: ->
    @state "in"

  out: ->
    @state "out"

  backIn: ->
    @state "back-in"

  backOut: ->
    @state "back-out"

  state: (name) ->
    @el.addClass("active").attr("data-state", name)

  section: (id) ->
    @tunnel "navigation", @

    @el.children("##{id}").addClass("active").siblings("section").removeClass("active")
     # @TODO: Optimize section triggers
    for child in @children when child.constructor.base is "Section"
      if child.attributes.id is id
        child.show()
      else
        child.hide()

    @aside() if @el.attr("data-state") is "aside-in"

  aside: ->
    method = if @el.hasClass "aside" then "out" else "in"
    if @attributes.aside? then do Atoms.App.Aside[@attributes.aside][method]
    if method is "out" then @el.removeClass "aside"
    @state "aside-#{method}"

  onAnimationEnd: (event) =>
    state = @el.attr "data-state"
    @trigger state
    if state in ["in", "back-out"]
      @trigger "active"
    else if state in ["out", "back-in"]
      @trigger "inactive"

    unless state in ["in", "back-out", "aside-in", "aside-out"] then @el.removeClass("active")
    if state is "aside-in" then @el.addClass "aside"

    @el.removeAttr "data-state"
