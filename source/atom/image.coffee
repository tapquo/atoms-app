###
@TODO

@namespace Atoms.Atom
@class Image

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Image extends Atoms.Class.Atom

  @template : """
    <img src="{{url}}" {{#if.style}}class="{{style}}"{{/if.style}} {{#if.alt}}alt="{{alt}}"{{/if.alt}}/>"""

  @base     : "Image"

  @events   : ["touch", "tap", "hold", "swipe", "rotate"]
