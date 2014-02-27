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
      {{#if.text}}{{text}}{{/if.text}}
    </{{size}}>"""

  @base : "Heading"

  constructor: ->
    @default = size: "h1"
    super
