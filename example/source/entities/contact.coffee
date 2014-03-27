class Atoms.Entity.Contact extends Atoms.Class.Entity

  @fields "id", "name", "description", "url", "when", "style"

  parse: ->
    image       : @url
    date        : @when
    text        : @name
    description : @description
    style       : @style
