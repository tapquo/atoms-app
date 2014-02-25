class Second extends Atoms.Organism.Article
  @scaffold "source/second/second.yml"

  constructor: ->
    super
    console.log "article.second", @

  esteButtonTouch: (event) ->
    @

  deleteButtonTouch: (event) ->
    @

  onConfirm: (event, dispatcher, hierarchy...) ->
    modal = new Atoms.Molecule.Confirm
      icon    : "search"
      title   : "Find your friends"
      text    : "lorem ipsum"
      accept  : "Yes"
      cancel  : "No"
    modal.show()
    modal.bind "accept", @acceptConfirm
    modal.bind "cancel", @cancelConfirm

  onForm: (event, dispatcher, hierarchy...) ->
    new Window() unless Atoms.App.Modal.Window?
    Atoms.App.Modal.Window.show()

  onButtonTouch: (event, dispatcher, hierarchy...)->
    console.log "onButtonTouch"

  acceptConfirm: ->
    Atoms.App.Modal.Loading.show()
    setTimeout ->
      Atoms.App.Modal.Loading.hide()
    , 3000

  cancelConfirm: ->
    console.log "cancel"

second = new Second()



class Window extends Atoms.Organism.Modal

  constructor: (attributes = {}) ->
    attributes.children = [
      "Organism.Header": children: [
        "Atom.Icon": icon: "help"
        "Atom.Title": text: "Send"
      ]
    ,
      "Organism.Section": children: [
        "Molecule.Form": children: [
          "Atom.Input": type: "text"
        ,
          "Atom.Input": type: "password"
        ,
          "Atom.Button": style: "fluid accept big", text: "Cancel", callbacks: ["onCancel"]
        ]
      ]
    ,
      "Organism.Footer": children: [
        "Molecule.Navigation": children: [
          "Atom.Button": text: "Accept", callbacks: ["onAccept"]
        ,
          "Atom.Button": text: "Cancel", callbacks: ["onCancel"]
        ]
      ]
    ]
    super attributes

  onAccept: ->
    @hide()
    Atoms.App.Modal.Loading.show()
    setTimeout ->
      Atoms.App.Modal.Loading.hide()
    , 3000
    false

  onCancel:  ->
    @hide()
    false

