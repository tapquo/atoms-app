class First extends Atoms.Organism.Article

  @scaffold "source/organisms/first.json"

  constructor: ->
    super
    @bind "in", (event) -> @_log "in", event
    @bind "out", (event) -> @_log "out", event
    @bind "active", (event) -> @_log "active", event
    @bind "inactive", (event) ->  @_log "inactive", event

    Atoms.Entity.Contact.bind "create", (entity) -> console.log "entity.create.organism"
    Atoms.Entity.Contact.bind "update", (entity) -> console.log "entity.update.organism"
    Atoms.Entity.Contact.bind "destroy", (entity) -> console.log "entity.destroy.organism"

  render: ->
    super
    # Example of Async Process Render with Entity
    setTimeout =>
      Atoms.Entity.Contact.create name: "@soyjavi", description: "Test", url: "http://cdn.tapquo.com/photos/soyjavi.jpg"
      Atoms.Entity.Contact.create name: "@tapquo", description: "Test 2", when: "10/04/1980"
      for i in [1..10]
        Atoms.Entity.Contact.create name: "Name #{i}", when: "10/04/1980"
      @contacts.list.entity Atoms.Entity.Contact.all()
    , 1000


  _log: (method, event) -> console.log "article > #{method}", event

  onContactUpdate: (event, atom) ->
    atom.entity.updateAttributes name: "Hello Atoms", description: "It's updated!"
    false

  onContactDelete: (event, atom) ->
    atom.entity.destroy()
    false

  # Form events
  onFormKeyup: (event, form, hierarchy...) ->
    console.info "ku", event, form, hierarchy

  onFormKeypress: (event, form, hierarchy...) ->
    console.info "kp", event, form, hierarchy

  onSelectChange: (event, form, hierarchy...) ->
    console.info "bubbleSelectChange", event, form, hierarchy

  onFormChange: (event, form, hierarchy...) ->
    console.info "bubbleFormChange", event, form, hierarchy

  onFormSubmit: (event, form, hierarchy...) ->
    console.info "submit", form.value()

  onSwitchChange: (event, atom) ->
    console.log "change??", atom.value()

  _modalShow: () ->
    Atoms.App.Modal.Loading.show()
    setTimeout ->
      Atoms.App.Modal.Loading.hide()
    , 850

first = new First()
