###
@TODO

@namespace Atoms.Atom
@class Audio

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Atom.Audio extends Atoms.Class.Atom

  @template : """<audio {{#if.autoplay}}autoplay="{{autoplay}}"{{/if.autoplay}} {{#if.controls}}controls="{{controls}}"{{/if.controls}} {{#if.preload}}preload="{{preload}}"{{/if.preload}} {{#if.loop}}loop="{{loop}}"{{/if.loop}} {{#if.src}}src="{{src}}"{{/if.src}}></audio>"""

  @base     : "Audio"

  @events   : ["load", "error", "downloading", "play", "timing", "pause", "stop", "end"]

  proxy_events:
    load        : "canplaythrough"
    downloading : "progress"
    timing      : "timeupdate"
    end         : "ended"

  constructor: ->
    super
    for event in @attributes.events or [] when event of @proxy_events
      @_listen @proxy_events[event], event

  src: (url, type="audio/mpeg") ->
    if url
      @el.attr "src", url
      @el.attr "type", type if type
      @el[0].load()
    else
      @el.attr "src"

  play: ->
    @el[0].play()

  stop: ->
    @el[0].time 0

  pause: ->
    @el[0].pause()

  volume: (percent) ->
    if percent?
      @el[0].volume = parseInt(percent) / 100
    else
      @el[0].volume

  time: (value) ->
    if value
      @el[0].currentTime = value
    else
      @el[0].currentTime

  duration: ->
    @el[0].duration

  _listen: (event, bubble) ->
    @el.bind event, (event) => @bubble bubble, event
