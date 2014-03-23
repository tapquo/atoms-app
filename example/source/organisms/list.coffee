"use strict"

class List extends Atoms.Organism.Article

  @scaffold "source/organisms/list.json"

  render: ->
    super
    # Example of Async Process Render with Entity
    Atoms.Entity.Contact.create name: "@soyjavi", description: "Test", url: "http://cdn.tapquo.com/photos/soyjavi.jpg"
    Atoms.Entity.Contact.create name: "@tapquo", description: "Test 2", when: "10/04/1980"
    Atoms.Entity.Contact.create name: "Name #{i}", when: "10/04/1980" for i in [1..10]

  # Children Bubble Events
   onSearchChange: (event, search) ->
    value = search.value()
    if value
      @contacts.list.select (entity) -> entity if entity.name.indexOf(value) > -1
    else
      @contacts.list.all()

  onSearchEnter: (event, search) ->
     @contacts.list.findBy "name", search.value()

  onContactUpdate: (event, atom) ->
    atom.entity.updateAttributes name: "Hello Atoms", description: "It's updated!"
    false

  onContactDelete: (event, atom) ->
    atom.entity.destroy()
    false

list = new List()
