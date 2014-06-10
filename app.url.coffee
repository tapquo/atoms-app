###
HTML5 API History Wrapper

@namespace Atoms
@class Url

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

Atoms.App.Url = do (a = Atoms) ->

  _article = undefined
  _aside   = undefined
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
            _article.state("back-in").addClass(article.attributes.style) if _article
          else
            _article.state("out")
            article.state("back-out").removeClass(_article.attributes.style)
          _article = article
        else
          _article.aside _aside if _article?.el.hasClass "aside"
      , 10

  _aside = (id = _aside) ->
    _article?.aside _aside = id

  _activeSection = (article, section) ->
    _addStepHistory()
    article.section section

  _addStepHistory = ->
    state = window.history.state or steps: 0
    state.steps++
    window.history.replaceState state, document.title

  _stepHistory = (value) ->
    window.history.replaceState steps: value, document.title

  Atoms.$ ->
    url = Atoms.Url.path().split("/")
    if url.length is 3 then _onChangeRoute article: url[1], section: url[2]
    Atoms.Url.listen "/:article/:section", _onChangeRoute

  aside   : _aside
