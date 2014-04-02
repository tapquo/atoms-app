###
@TODO

@namespace Atoms.Atom
@class Figure

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Figure extends Atoms.Class.Atom

  @template : """
    <figure {{#if.style}}class="{{style}}"{{/if.style}} {{#if.url}}style="background-image: url({{url}});"{{/if.url}}></figure>"""

  @base     : "Figure"

  @events   : ["touch", "tap", "hold", "swipe", "rotate"]
