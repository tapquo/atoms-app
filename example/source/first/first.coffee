class First extends Atoms.Organism.Article

  @scaffold "source/first/first.yml"

  constructor: ->
    super
    @bind "in", (event) -> @_log "in", event
    @bind "out", (event) -> @_log "out", event
    @bind "active", (event) -> @_log "active", event
    @bind "inactive", (event) ->  @_log "inactive", event

  render: ->
    super
    list =  @children[2].appendChild "Molecule", "ListContacts"
    # Example of Async Process Render
    Atoms.Entity.Contact.create name: "@soyjavi", description: "Test", url: "sjsjjs"
    Atoms.Entity.Contact.create name: "@piniphone", description: "Test 2", when: "10/04/1980"
    Atoms.Entity.Contact.create name: "@tapquo"
    # Entity
    list.entityAtom "Li"
    list.entity Atoms.Entity.Contact.all()


  _log: (method, event) -> console.log "article > #{method}", event


  onLiTouch: (event, atom) ->
    console.log ">>> bubble", atom, atom.attributes.entity
    # atom.entity.updateAttributes text: "Hello", description: "UPDATED!",

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

  _modalShow: () ->
    Atoms.App.Modal.Loading.show()
    setTimeout ->
      Atoms.App.Modal.Loading.hide()
    , 850

first = new First()


class Atoms.Entity.Contact extends Atoms.Class.Entity

  @fields "id", "name", "description", "url", "when"

  parse: ->
    image       : @url
    date        : @when
    text        : @name
    description : @description
