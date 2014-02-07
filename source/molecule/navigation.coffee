###
Basic fieldset for search

@namespace Atoms.Molecule
@class Navigation

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Navigation extends Atoms.Class.Molecule

  @template : """<nav {{#if.style}}class="{{style}}"{{/if.style}}></nav>"""

  @available: ["Atom.Button", "Atom.Link"]

  @base : "Navigation"

  onButtonTouch: (event, atom) =>
    atom.el.addClass("active").siblings().removeClass("active")

    @bubble "select", event if "select" in @attributes.events?

    path = atom.attributes.path
    if path
      if path is "aside"
        Atoms.App.Url.aside()
      else if path is "back"
        Atoms.Url.back()
      else if path?
        Atoms.Url.path path
      false
