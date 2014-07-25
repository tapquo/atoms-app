###
Global namespace for Atoms.App

@namespace Atoms
@class     App

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

window.__ = Atoms.App =
  version   : "0.07.25"
  Article   : {}
  Aside     : {}
  Dialog    : {}
  Entity    : {}
  Extension : {}
  Url       : null

Atoms.$ ->
  Atoms.$(document.body).addClass "standalone" if navigator.standalone
