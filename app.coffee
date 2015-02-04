###
Global namespace for Atoms.App

@namespace Atoms
@class     App

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

window.__ = Atoms.App =
  version     : "0.14.04"
  Article     : {}
  Aside       : {}
  Dialog      : {}
  Entity      : {}
  Extension   : {}
  Url         : null
  Constants   :
    ANIMATION:
      DURATION: 450
      END     : "webkitAnimationEnd MSAnimationEnd animationend"

Atoms.$ ->
  Atoms.$(document.body).addClass "standalone" if navigator.standalone
