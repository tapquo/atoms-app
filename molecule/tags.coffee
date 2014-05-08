###
Basic fieldset for search

@namespace Atoms.Molecule
@class Search

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Tags extends Atoms.Class.Molecule

  @template : """<nav {{#if.style}}class="{{style}}"{{/if.style}} onsubmit="return false;"></nav>"""

  @available: ["Atom.Label"]

  @base     : "Tags"
