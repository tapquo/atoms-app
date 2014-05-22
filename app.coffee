# Globals
window.__ = Atoms.App =
  version   : "0.05.22"
  Article   : {}
  Aside     : {}
  Modal     : {}

  Extension : {}
  Url       : null

Atoms.$ ->
  Atoms.$(document.body).addClass "standalone" if navigator.standalone
