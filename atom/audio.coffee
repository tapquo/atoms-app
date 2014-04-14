###
@TODO

@namespace Atoms.Atom
@class Audio

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Audio extends Atoms.Class.Atom

  @template : """<audio {{#if.autoplay}}autoplay{{/if.autoplay}} {{#if.controls}}controls{{/if.controls}} {{#if.preload}}preload{{/if.preload}} {{#if.loop}}loop{{/if.loop}} {{#if.src}}src="{{src}}"{{/if.src}}></audio>"""

  @base     : "Audio"

  @events   : ["play", "pause", "end", "progress"]

  constructor: ->
    super
    for event in @attributes.events
      if event is "play" then @_listen "play", event
      if event is "pause" then @_listen "pause", event
      if event is "end" then @_listen "ended", event
      if event is "progress" then @_listen "progress", event

  src: (url, type="audio/mpeg") ->
    @el.attr "src", url
    @el.attr "type", type if type

  play: ->
    @el[0].play()

  stop: ->
    @el[0].load()

  pause: ->
    @el[0].pause()

  _listen: (event, bubble) ->
    @el.bind event, (event) => @bubble bubble, event
