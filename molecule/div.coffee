###
@TODO

@namespace Atoms.Molecule
@class Div

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Div extends Atoms.Class.Molecule

  @template : """
    <div {{#if.style}}class="{{style}}"{{/if.style}}></div>"""

  @base     : "Div"

  @events   : ["touch"]

  constructor: ->
    super
    do @bindEvents

  ###
  Binds to user interface events.
  @method bindEvents
  ###
  bindEvents: ->
    do @handleInputEvent if @attributes.events
