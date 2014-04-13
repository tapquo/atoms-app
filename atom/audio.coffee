###
@TODO

@namespace Atoms.Atom
@class Audio

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Audio

  @template: "<audio></audio>"

  @base     : "Audio"

  set: (url) ->
    @setAttribute "src", url
    @setAttribute "preload", true
    @setAttribute "type", "audio/mpeg"
    @load()

  play: ->
    @play()

  stop: ->
    @stop()

  pause: ->
    @pause()
