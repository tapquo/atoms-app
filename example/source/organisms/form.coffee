class Form extends Atoms.Organism.Article

  @scaffold "source/organisms/form.json"

  constructor: ->
    super
    @bind "in", (event) -> __log "in", event
    @bind "out", (event) -> __log "out", event
    @bind "active", (event) -> __log "active", event
    @bind "inactive", (event) ->  __log "inactive", event

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

  onButtonTouch: (event, atom, hierarchy) ->
    Atoms.App.Modal.Loading.show()
    setTimeout ->
      Atoms.App.Modal.Loading.hide()
    , 850

form = new Form()

__log = (method, event) -> console.log "article > #{method}", event
