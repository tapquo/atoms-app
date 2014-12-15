###
Base class for Organism

@namespace  Atoms.Organism
@extends    Dialog
@class      Loading

@author     Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Organism.Loading extends Atoms.Organism.Dialog

  # Publics
  show: ->
    @el.parent().addClass "active"
    @el.addClass "show"
    setTimeout (=> do @onAnimationEnd), 450

  hide: ->
    @el.addClass "hide"

new Atoms.Organism.Loading()
