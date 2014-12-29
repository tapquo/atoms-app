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
                <h1></h1>
                <section>
                  <figure></figure>
                  <p></p>
                </section>
              </article>"""

  constructor: (attributes) ->
    super attributes
    @parent = @el.parent().addClass "no-block"
    @title = @el.children("h1")
    @text = @el.find("p")
    @figure = @el.find("figure")
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

    @el.parent().addClass "active"
    @el.addClass "show"
    @trigger "show"
    #@TODO: Hack for Firefox AnimationEnd listener fails
    setTimeout (=> do @onAnimationEnd), 450

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
