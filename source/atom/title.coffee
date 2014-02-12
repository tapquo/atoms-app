###
@TODO

@namespace Atoms.Atom
@class Label

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Title extends Atoms.Class.Atom

  @template : """
    <h1 {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.image}}<img src="image" />{{/if.image}}
      {{#if.text}}{{text}}{{/if.text}}
    </h1>"""

  @base : "Title"
