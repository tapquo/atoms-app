###
@TODO

@namespace Atoms.Atom
@class Link

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Link extends Atoms.Class.Atom

  @template : """
    <a href="{{href}}" {{#if.style}}class="{{style}}"{{/if.style}}>
      {{#if.icon}}<span class="icon {{icon}}"></span>{{/if.icon}}
      {{#if.text}}{{text}}{{/if.text}}
    </a>"""

  @base : "Link"
