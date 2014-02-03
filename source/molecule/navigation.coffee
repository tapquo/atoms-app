###
Basic fieldset for search

@namespace Atoms.Molecule
@class Navigation

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Navigation extends Atoms.Class.Molecule

  @template = """<nav class="{{style}}"></nav>"""

  available: ["button"]

  bubbleButtonTouch: (event, atom) =>
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
