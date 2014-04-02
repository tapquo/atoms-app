###
@TODO

@namespace Atoms.Atom
@class Button

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Button extends Atoms.Class.Atom

  @template : """
    <button class="{{style}}{{^if.text}} icon{{/if.text}}" {{#if.disabled}}disabled{{/if.disabled}}>
      {{#if.icon}}<span class="icon {{icon}}"></span>{{/if.icon}}
      {{#if.text}}<abbr>{{text}}</abbr>{{/if.text}}
    </button>"""

  @base     : "Button"

  @events   : ["touch"]

  @default  :
    events: ["touch"]
