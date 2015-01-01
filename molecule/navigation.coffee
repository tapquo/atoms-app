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
  onButtonTouch: (event, atom) ->
    @_bubbleSelect event, atom

  onLinkTouch: (event, atom) ->
    @_bubbleSelect event, atom

  # Parent Tunnel Events
  onUrlChange: (event, article, hierarchy...) ->
    path = Atoms.Url.path().substr(1)
    for child in @children when child.attributes.path is path
      @_active child
      break
    false

  onSectionScroll: (event, dispatcher) ->
    @el[(if event.addClass then "addClass" else "removeClass")] "scroll"
    false

  # Private
  _active: (atom) ->
    atom.el.addClass("active").siblings().removeClass("active")

  _bubbleSelect: (event, atom) ->
    event.preventDefault()
    if not atom.attributes.callbacks?.length > 0
      atom.el
        .addClass "active"
        .siblings().removeClass "active"
      @bubble "select", event, atom
      __path atom.attributes.path if atom.attributes.path?
      false

__path = (path) ->
  if path?
    parts = path.split("/")

    # If it's back or aside
    if parts.length is 1
      if parts[0] is "back"
        Atoms.Url.back()
      else
        Atoms.App.Url.aside parts[0]

    # If it's a different address
    else if parts.length is 2 and Atoms.Url.path() isnt "/#{path}"
      Atoms.Url.path path
  false
