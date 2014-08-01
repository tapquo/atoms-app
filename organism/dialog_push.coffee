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
    @el.parent().addClass "no-block"
    @el.on "touch", @_onTouch

  # -- Instance Methods ---------------------------------------------------------
  show: (title, description, image = "", timeout = 3000) ->
    clearTimeout @id_timeout
    @el.parent().removeClass "expand"
    @el.children("h1").html title
    @el.find("p").html description
    @el.find("figure").css "background-image", "url('#{image}')"
    super
    @id_timeout = setTimeout =>
      do @hide unless @el.parent().hasClass "expand"
    , timeout

  hide: ->
    super
    __.Url.current().front()
    clearTimeout @id_timeout

  # -- Private Methods --------------------------------------------------------
  _onTouch: (event) =>
    unless @el.parent().hasClass "expand"
      @el.parent().addClass "expand"
      __.Url.current().back()
    else
      do @hide

new Atoms.Organism.Push()
