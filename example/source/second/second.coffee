class Second extends Atoms.Organism.Article
  @scaffold "source/second/second.yml"

  constructor: ->
    super
    console.log "article.second", @

  esteButtonTouch: (event) ->
    @

  deleteButtonTouch: (event) ->
    @

  bubbleButtonTouch: (event, dispatcher, hierarchy...)->
    console.log "argynebts", event, dispatcher.attributes.id
    modal = new Atoms.Molecule.Confirm
      icon    : "search"
      title   : "Find your friends"
      text    : "lorem ipsum"
      accept  : "Yes"
      cancel  : "No"
    modal.show()
    modal.bind "accept", @acceptConfirm
    modal.bind "cancel", @cancelConfirm

  acceptConfirm: ->
    console.log "accept"
    Atoms.App.Modal.Loading.show()

  cancelConfirm: ->
    console.log "cancel"



second = new Second()
