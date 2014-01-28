###
Base for lists

@namespace Atoms.Molecule
@class List

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.List extends Atoms.Class.Molecule

  @template = """<ul></ul>"""

  # Publics
  filter: -> @

  clean: -> @
