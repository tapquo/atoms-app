###
Async

@namespace Atoms
@class file

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

Atoms.resource = (extension, type, url) ->
  promise = new Hope.Promise()

  file = document.createElement(type)
  file.setAttribute "data-extension", extension
  file.onload = -> promise.done null, true
  file.onError = -> promise.done true, null
  if type is "script"
    file.type = "text/javascript"
    file.src = url
    document.body.appendChild file
  else
    file.rel = "stylesheet"
    file.href = url
    document.head.appendChild file
  promise
