###
@TODO

@namespace Atoms.Atom
@class Progress

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Progress extends Atoms.Class.Atom

  @template : """
    <progress {{#if.style}}class="{{style}}"{{/if.style}} {{#if.max}}max="{{max}}"{{/if.max}} {{#if.value}}value="{{value}}"{{/if.value}}></progress>"""

  @base     : "Progress"

  @default  :
    max   : 100
    value : 0

  value: (value) ->
    if value? then @el[0].value = value else @el[0].value
