###
HTML5 API History Wrapper

@namespace Atoms
@class Url

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

Atoms.App.Url = do (a = Atoms) ->

  _article = undefined
  _options = Atoms.Url.options

  # Private
  _onChangeRoute = (properties) ->
    article = a.App.Article[properties.article.toClassName()]
    if article
      unless article.el then article.render()
      setTimeout ->
        unless _options.forward then _stepHistory 0
        _activeSection article, properties.section
        if _article isnt article
          if _options.forward
            _stepHistory 1
            article.state("in")
            _article.state("back-in") if _article
          else
            _article.state("out")
            article.state("back-out")
          _article = article
      , 10
    else
      console.error "[ATOMS]: Url #{properties.url} not exists."

  _aside = (id) ->
    _article?.aside id

  _activeSection = (article, section) ->
    _addStepHistory()
    article.section section

  _addStepHistory = ->
    state = window.history.state or steps: 0
    state.steps++
    window.history.replaceState state

  _stepHistory = (value) ->
    window.history.replaceState steps: value

  do ->
    Atoms.Url.listen "/:article/:section", _onChangeRoute

  aside   : _aside
