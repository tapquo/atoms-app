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

  @base     : "Navigation"

  @events   : ["select"]

  # Children Bubble Events
  onButtonTouch: (event, atom) =>
    @_active atom
    @bubble "select", event, atom
    __path atom.attributes.path
    false

  onLinkTouch: (event, atom) ->
    if atom.attributes.path?
      event.preventDefault()
      __path atom.attributes.path
    false

  # Parent Tunnel Events
  onArticleChange: (event, article, hierarchy...) ->
    path = Atoms.Url.path().substr(1)
    for child in @children when child.attributes.path is path
      @_active child
      break
    false

  onSectionScroll: (event, dispatcher) ->
    if event.down
      @el.addClass "scroll"
    else
      @el.removeClass "scroll"
    false


  # Private
  _active: (atom) ->
    atom.el.addClass("active").siblings().removeClass("active")


__path = (path) ->
  if path?
    parts = path.split("/")

    # If it's back or aside
    if parts.length is 1
      if parts[0] is "back"
        Atoms.Url.back()
      else
        Atoms.App.Url.aside parts[0]

    # If it's the same address
    else if Atoms.Url.path() is "/#{path}"
      Atoms.App.Url.aside()

    # If it's a different address
    else if parts.length is 2
      Atoms.Url.path path
  false
