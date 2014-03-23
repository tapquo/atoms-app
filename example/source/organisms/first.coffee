class First extends Atoms.Organism.Article

  @scaffold "source/organisms/first.json"

  constructor: ->
    super
    @bind "in", (event) -> @_log "in", event
    @bind "out", (event) -> @_log "out", event
    @bind "active", (event) -> @_log "active", event
    @bind "inactive", (event) ->  @_log "inactive", event


  _log: (method, event) -> console.log "article > #{method}", event

  # Form events
  onFormChange: (event, form, hierarchy...) ->
    console.info "onFormChange", event, form, hierarchy

  onFormSubmit: (event, form, hierarchy...) ->
    console.info "onFormSubmit", form.value()

  onFormError: (event, form, hierarchy...) ->
    console.info "onFormError", form.value()

  # Form children events
  onInputKeyup: (event, atom, hierarchy...) ->
    console.info "onInputKeyup", atom.value()

  onSelectChange: (event, atom, hierarchy...) ->
    console.info "onSelectChange", atom.value()

  onSwitchChange: (event, atom) ->
    console.log "onSwitchChange", atom.value()

  # Others
  _modalShow: () ->
    Atoms.App.Modal.Loading.show()
    setTimeout ->
      Atoms.App.Modal.Loading.hide()
    , 850

first = new First()
