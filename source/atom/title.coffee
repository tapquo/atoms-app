###
@TODO

@namespace Atoms.Atom
@class Label

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Title extends Atoms.Class.Atom

  @template : """
    <{{size}} {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.image}}<img src="image" />{{/if.image}}
      {{#if.text}}{{text}}{{/if.text}}
    </{{size}}>"""

  @base : "Title"

  constructor: ->
    @default =
      size: "h1"

    super
