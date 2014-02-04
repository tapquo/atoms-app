class Second extends Atoms.Organism.Article
  @scaffold "source/second/second.yml"

  constructor: ->
    super
    console.log "article.second", @

  esteButtonTouch: (event) ->
    @

  deleteButtonTouch: (event) ->
    @

  onFindFriends: (event, dispatcher, hierarchy...) ->
    modal = new Atoms.Molecule.Confirm
      icon    : "search"
      title   : "Find your friends"
      text    : "lorem ipsum"
      accept  : "Yes"
      cancel  : "No"
    modal.show()
    modal.bind "accept", @acceptConfirm
    modal.bind "cancel", @cancelConfirm

  onButtonTouch: (event, dispatcher, hierarchy...)->
    console.log "onButtonTouch"

  acceptConfirm: ->
    console.log "accept"
    Atoms.App.Modal.Loading.show()

  cancelConfirm: ->
    console.log "cancel"

second = new Second()
