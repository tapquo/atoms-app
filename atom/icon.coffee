###
@TODO

@namespace Atoms.Atom
@class Icon

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Icon extends Atoms.Class.Atom

  @template : """
    <span class="icon {{#if.icon}}{{icon}}{{/if.icon}} {{#if.style}}{{style}}{{/if.style}}"></span>"""

  @base     : "Icon"
