class Options extends Atoms.Organism.Aside
  @scaffold "source/organisms/default.json"

  constructor: ->
    super
    @bind "in", (event) -> @_log "in", event
    @bind "out", (event) -> @_log "out", event

  render: ->
    super
    # setTimeout =>
    #   @list.contacts.entity Atoms.Entity.Contact.all()
    # , 1000

  _log: (method, event) ->
    console.log "aside.#{method}", event

aside = new Options()
