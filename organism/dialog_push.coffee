###
Base class for Organism

@namespace  Atoms.Organism
@extends    Dialog
@class      Push

@author     Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Push extends Atoms.Organism.Dialog

  @template: """
              <article>
                <header>
                  <figure></figure>
                  <span class="icon user"></span>
                  <h1></h1>
                </header>
                <section>
                  <p></p>
                </section>
              </article>"""

  constructor: (attributes) ->
    super attributes
    @parent = @el.parent().addClass "no-block"
    @figure = @el.find("figure")
    @icon = @el.find(".icon")
    @title = @el.find("h1")
    @text = @el.find("p")
    @el.on "touch", @_onTouch

  # -- Instance Methods ---------------------------------------------------------
  show: (attributes, timeout = 3000) ->
    clearTimeout @id_timeout
    @parent.removeClass "expand"
    @title.html attributes.title
    @text.html attributes.description
    @figure.hide()
    if attributes.image?
      @figure.show().css "background-image", "url('#{attributes.image}')"
    @icon.hide()
    if attributes.icon?
      @icon.show().attr "class", "icon #{attributes.icon}"

    @el.parent().addClass "active"
    @el.addClass "show"
    @trigger "show"
    #@TODO: Hack for Firefox AnimationEnd listener fails
    setTimeout (=> do @onAnimationEnd), __.Constants.ANIMATION.DURATION

    if attributes.timeout?
      @id_timeout = setTimeout =>
        do @hide unless @parent.hasClass "expand"
      , attributes.timeout

  hide: ->
    @el.addClass "hide"
    @trigger "hide"
    __.Url.current()?.front()

    clearTimeout @id_timeout

  # -- Private Methods --------------------------------------------------------
  _onTouch: (event) =>
    unless @parent.hasClass "expand"
      @parent.addClass "expand"
      __.Url.current()?.back()
    else
      do @hide

new Atoms.Organism.Push()
