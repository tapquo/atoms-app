###
Base for lists

@namespace Atoms.Molecule
@class List

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.List extends Atoms.Class.Molecule

  @template : """<ul {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></ul>"""

  @available: ["Atom.Li"]

  @base     : "List"

  @events   : ["select"]

  findBy: (field, value) =>
    @select (entity) ->
      entity if entity[field]?.toLowerCase().trim() is value.toLowerCase().trim()

  select: (callback) =>
    do @clean
    @children = []
    if callback
      records = (record for record in @_records when callback record.entity)
    for record in records or @_records
      @_addAtomEntity record.entity, record = false

  all: ->
    do @select

  clean: ->
    @el.html ""

  # Children Bubble Events
  onLiSingleTap: (event, atom) =>
    @_bubbleSelect event, atom

  onLiTap: (event, atom) =>
    @_bubbleSelect event, atom

  _bubbleSelect: (event, atom) ->
    event.preventDefault()
    @bubble "select", atom
    false
