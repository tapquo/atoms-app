###
@TODO

@namespace Atoms.Atom
@class Figure

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Figure extends Atoms.Class.Atom

  @template : """
    <figure {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.url}}<span class="loading-animation"></span>{{/if.url}}
    </figure>"""

  @base     : "Figure"

  @events   : ["touch", "tap", "hold", "swipe", "rotate"]

  _render: ->
    super
    if @attributes.url
      image = new Image()
      image.addEventListener "load", (event) =>
        @el.html ""
        @el.attr "style", "background-image: url(#{@attributes.url});"
      image.src = @attributes.url
