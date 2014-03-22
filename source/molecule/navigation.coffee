###
Basic fieldset for search

@namespace Atoms.Molecule
@class Navigation

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Navigation extends Atoms.Class.Molecule

  @template : """<nav {{#if.id}}id="{{id}}"{{/if.id}} {{#if.style}}class="{{style}}"{{/if.style}}></nav>"""

  @available: ["Atom.Button", "Atom.Link"]

  @base     : "Navigation"

  constructor: ->
    @default = style: "left"
    super

  # Children Bubble Events
  onButtonTouch: (event, atom) =>
    @_active atom

    @bubble "select", event if @attributes.events? and "select" in @attributes.events
    path = atom.attributes.path
    if path
      if path is "aside"
        Atoms.App.Url.aside()
      else if path is "back"
        Atoms.Url.back()
      else if path?
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
