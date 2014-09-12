###
Global namespace for Atoms.App

@namespace Atoms
@class     App

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

window.__ = Atoms.App =
  version   : "0.09.12"
  Article   : {}
  Aside     : {}
  Dialog    : {}
  Entity    : {}
  Extension : {}
  Url       : null

Atoms.$ ->
  Atoms.$(document.body).addClass "standalone" if navigator.standalone

  # Size
  w = window.innerWidth
  h = window.innerHeight
  Atoms.$(document.body)
    .attr "data-screen", if (h > w and w < 480) or (h < w and h < 480) then "small" else "normal"

  # Os
  OS =
    ios           : /ipad|iphone|ipod/i
    android       : /android/i
    blackberry    : /blackberry/i
    webos         : /webos/i
    windows_phone : /windows phone/i
    firefox_os    : /(Mozilla).*Mobile[^\/]*\/([\d\.]*)/
  useragent = navigator.userAgent.toLowerCase()
  for type, regexp of OS when regexp.test(useragent) is true
    w = window.innerWidth
    h = window.innerHeight
    Atoms.$(document.body).attr "data-os", type
    break
