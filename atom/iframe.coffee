###
@TODO

@namespace Atoms.Atom
@class Iframe

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Iframe extends Atoms.Class.Atom

  @template : """
    <iframe {{#if.url}}src="{{url}}"{{/if.url}} {{#if.style}}class="{{style}}"{{/if.style}}></iframe>"""

  @base     : "Iframe"
