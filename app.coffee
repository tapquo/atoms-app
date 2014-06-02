# Globals
window.__ = Atoms.App =
  version   : "0.06.02"
  Article   : {}
  Aside     : {}
  Modal     : {}

  Extension : {}
  Url       : null

Atoms.$ ->
  Atoms.$(document.body).addClass "standalone" if navigator.standalone
