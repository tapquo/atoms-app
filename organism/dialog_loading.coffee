###
Base class for Organism

@namespace  Atoms.Organism
@extends    Dialog
@class      Loading

@author     Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Loading extends Atoms.Organism.Dialog

  constructor: (attributes) ->
    super attributes
    @el.html """<span class="loading-animation"></span>"""
    @el.parent().addClass "loading"

  # Publics
  show: ->
    @el.parent().addClass "active"
    @el.addClass "show"
    setTimeout (=> do @onAnimationEnd), __.Constants.ANIMATION.DURATION

  hide: ->
    @el.addClass "hide"

new Atoms.Organism.Loading()
