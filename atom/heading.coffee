###
@TODO

@namespace Atoms.Atom
@class Heading

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Heading extends Atoms.Class.Atom

  @template : """
    <{{size}} {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.image}}<img src="image" />{{/if.image}}
      {{#if.value}}{{value}}{{/if.value}}
    </{{size}}>"""

  @base     : "Heading"

  @default  :
    size: "h1"
