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
      {{#if.image}}<figure><span class="icon loading-d"></span></figure>{{/if.image}}
      <div>
        {{#if.info}}<span>{{info}}</span>{{/if.info}}
        {{#if.text}}<strong>{{text}}</strong>{{/if.text}}
        {{#if.description}}<small>{{description}}</small>{{/if.description}}
      </div>
    </li>"""

  @base     : "Li"

  @events   : ["tap", "singleTap", "doubleTap", "hold", "swipeLeft", "swipeRight"]

  _render: ->
    super
    if @attributes.image
      figure = @el.children("figure")
      image = new Image()
      image.addEventListener "load", (event) =>
        figure.html ""
        figure.attr "style", "background-image: url(#{@attributes.image});"
      image.src = @attributes.image

