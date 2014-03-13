class Atoms.Entity.Contact extends Atoms.Class.Entity

  @fields "id", "name", "description", "url", "when"

  parse: ->
    image       : @url
    date        : @when
    text        : @name
    description : @description
