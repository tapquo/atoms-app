class First extends Atoms.Organism.Article

  @scaffold "source/organisms/first.json"

  constructor: ->
    super
    @bind "in", (event) -> @_log "in", event
    @bind "out", (event) -> @_log "out", event
    @bind "active", (event) -> @_log "active", event
    @bind "inactive", (event) ->  @_log "inactive", event

  render: ->
    super
    # Example of Async Process Render with Entity
    Atoms.Entity.Contact.create name: "@soyjavi", description: "Test", url: "http://cdn.tapquo.com/photos/soyjavi.jpg"
    Atoms.Entity.Contact.create name: "@tapquo", description: "Test 2", when: "10/04/1980"
    for i in [1..10]
      Atoms.Entity.Contact.create name: "Name #{i}", when: "10/04/1980"
    # @contacts.list.entity Atoms.Entity.Contact.all()

  _log: (method, event) -> console.log "article > #{method}", event

  onContactUpdate: (event, atom) ->
    atom.entity.updateAttributes name: "Hello Atoms", description: "It's updated!"
    false

  onContactDelete: (event, atom) ->
    atom.entity.destroy()
    false

  # Serch events
  onSearchChange: (event, search, hierarchy...) ->
    console.info "onSearchChange", search.value()

  onSearchEnter: (event, search, hierarchy...) ->
    console.info "onSearchEnter", search.value()

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
