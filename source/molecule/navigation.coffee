###
Basic fieldset for search

@namespace Atoms.Molecule
@class Navigation

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Navigation extends Atoms.Class.Molecule

  @template : """<nav {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></nav>"""

  @available: ["Molecule.Form", "Atom.Button", "Atom.Link"]

  @base     : "Navigation"

  @events   : ["select"]

  # Children Bubble Events
  onButtonTouch: (event, atom) =>
    @_active atom
    @bubble "select", event, atom
    path = atom.attributes.path
    if path?
      parts = path.split("/")
      if parts.length is 1
        if parts[0] is "back"
          Atoms.Url.back()
        else
          Atoms.App.Url.aside parts[0]
      else if parts.length is 2
        Atoms.Url.path path
    false

  # Parent Tunnel Events
  onArticleNavigation: (event, article, hierarchy...) ->
    path = Atoms.Url.path().substr(1)
    for child in @children when child.attributes.path is path
      @_active child
      break
    false

  _active: (atom) ->
    atom.el.addClass("active").siblings().removeClass("active")
