class Extensions extends Atoms.Organism.Article

  @scaffold "source/organisms/extensions.json"

  onGMapMenu: (event, GMap) ->
    GMap.instance.zoom 3

extensions = new Extensions()
