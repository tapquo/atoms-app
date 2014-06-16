"use strict"

class __Media extends Atoms.Class.Atom

  @events: ["load", "error", "downloading", "play", "timing", "pause", "stop", "end"]

  constructor: ->
    super
    events =
      load        : "canplaythrough"
      downloading : "progress"
      timing      : "timeupdate"
      end         : "ended"
    for event in @attributes.events or [] when event of events
      @_listen events[event], event

  src: (url, type) ->
    if url
      @el.attr "src", url
      @el.attr "type", type if type
      @el[0].load()
    else
      @el.attr "src"

  play: ->
    @el[0].play()

  stop: ->
    @time 0
    @pause()

  pause: ->
    @el[0].pause()

  volume: (percent) ->
    if percent?
      @el[0].volume = parseInt(percent) / 100
    else
      @el[0].volume

  time: (value) ->
    if value?
      @el[0].currentTime = value
    else
      @el[0].currentTime

  duration: ->
    @el[0].duration

  _listen: (event, bubble) ->
    @el.bind event, (event) => @bubble bubble, event


###
@TODO

@namespace Atoms.Atom
@class Audio

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

class Atoms.Atom.Audio extends __Media
  @template : """<audio {{#if.autoplay}}autoplay="{{autoplay}}"{{/if.autoplay}} {{#if.controls}}controls="{{controls}}"{{/if.controls}} {{#if.preload}}preload="{{preload}}"{{/if.preload}} {{#if.loop}}loop="{{loop}}"{{/if.loop}} {{#if.src}}src="{{src}}"{{/if.src}}></audio>"""
  @base     : "Audio"

  src: (url, type = "audio/mpeg") ->
    super url, type

###
@TODO

@namespace Atoms.Atom
@class Audio

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###

class Atoms.Atom.Video extends __Media
  @template : """<video {{#if.autoplay}}autoplay="{{autoplay}}"{{/if.autoplay}} {{#if.controls}}controls="{{controls}}"{{/if.controls}} {{#if.preload}}preload="{{preload}}"{{/if.preload}} {{#if.loop}}loop="{{loop}}"{{/if.loop}} {{#if.src}}src="{{src}}"{{/if.src}}></video>"""
  @base     : "Video"

  src: (url, type = "audio/mpeg") ->
    super url, type
