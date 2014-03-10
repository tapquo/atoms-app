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

  @base : "List"

  # Publics
  filter: -> @

  clean: -> @
