###
@TODO

@namespace Atoms.Atom
@class Li

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Li extends Atoms.Class.Atom

  @template : """
    <li {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.image}}<figure><span class="icon loading-config"></span></figure>{{/if.image}}
      {{#if.icon}}<span class="icon {{icon}}"></span>{{/if.icon}}
      <div>
        {{#if.info}}<span>{{info}}</span>{{/if.info}}
        {{#if.text}}<strong>{{text}}</strong>{{/if.text}}
        {{#if.description}}<small>{{description}}</small>{{/if.description}}
      </div>
    </li>"""

  @base     : "Li"

  @events   : ["touch", "doubleTap", "hold", "swipeLeft", "swipeRight"]

  constructor: ->
    super
    do @bindDestroyable

  refresh: ->
    super
    do @bindDestroyable

  bindDestroyable: ->
    if "destroyable" in (@attributes.events or [])
      @destroying = false
      @el.bind "touchstart", (event) =>
        @destroying = false
        @el.css "transition", "none"

      @el.bind "swiping", (event) =>
        pixels = event.touch.delta.x
        return if pixels > 0
        pixels = Math.abs(pixels)
        if pixels < 128
          @el.css "right", "#{pixels}px"
          if pixels > 80 and not @destroying
            @destroying = true
            @el.addClass "destroy"
            setTimeout (=> @destroy()), 450

      @el.bind "touchend", (event) =>
        @el
          .css "transition", "right 450ms"
          .css "right", "0px"

  _render: ->
    super
    if @attributes.image
      figure = @el.children("figure")
      image = new Image()
      image.addEventListener "load", (event) =>
        figure.html ""
        figure.attr "style", "background-image: url(#{@attributes.image});"
      image.src = @attributes.image

