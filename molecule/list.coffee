###
Base for lists

@namespace Atoms.Molecule
@class List

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.List extends Atoms.Class.Molecule

  @template : """<ul {{#if.style}}class="{{style}}"{{/if.style}}></ul>"""

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
      records = (record for record in @cache when callback record.entity)
    for record in records or @cache
      @_addAtomEntity record.entity, @attributes.bind, save = false

  all: ->
    do @select

  clean: ->
    @el.html ""

  # -- Children Bubble Events --------------------------------------------------
  onLiTouch: (event, atom) =>
    @bubble "select", atom
    false
