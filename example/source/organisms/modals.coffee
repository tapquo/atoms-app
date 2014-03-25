class Second extends Atoms.Organism.Article
  @scaffold "source/organisms/modals.json"

  onConfirm: (event, dispatcher, hierarchy...) ->
    new ModalConfirm() unless Atoms.App.Modal.ModalConfirm?
    Atoms.App.Modal.ModalConfirm.show()

  onForm: (event, dispatcher, hierarchy...) ->
    new ModalForm() unless Atoms.App.Modal.ModalForm?
    Atoms.App.Modal.ModalForm.show()

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


class ModalConfirm extends Atoms.Organism.Modal

  constructor: (attributes = {}) ->
    attributes.children = [
      "Organism.Header": children: [
        "Atom.Icon": icon: "help"
        "Atom.Heading": text: "Send email?"
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
    , 1000
    false

  onCancel: ->
    @hide()
    false


class ModalForm extends Atoms.Organism.Modal

  constructor: (attributes = {}) ->
    attributes.children = [
      "Organism.Header": children: [
        "Atom.Heading": text: "Fill Form"
      ]
    ,
      "Organism.Section": children: [
        "Molecule.Form": children: [
          "Atom.Input": type: "text", placeholder: "..."
        ,
          "Atom.Textarea": placeholder: "..."
        ,
          "Atom.Button": style: "fluid accept big", text: "Cancel", callbacks: ["onCancel"]
        ]
      ]
    ]
    super attributes

  onCancel:  ->
    @hide()
    false

