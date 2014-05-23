## Molecule.List
Elemento que representa una lista de elementos del tipo *Atom.Li* y gestiona una entidad 
por cada una de ellos por medio del atributo especial *bind*. Podrá ser contenida en un *Organism.Section*.

### Attributes

```
id    : String [OPTIONAL]
style : String [OPTIONAL]
bind  : Object [OPTIONAL]
  entity   : String [REQUIRED]
  atom     : String [REQUIRED]
  events   : Array [OPTIONAL]
  callbacks: Array [OPTIONAL]
  create   : Boolean [OPTIONAL]
  update   : Boolean [OPTIONAL]
  destroy  : Boolean [OPTIONAL]
```

### Methods

#### .findBy()
Este método específico para la gestión de entidades sirve para filtrar los elementos de la lista por coincidencia de un determinado campo y una cadena de texto de su entidad.

**Parameters**

```
field    : String [REQUIRED]
value    : String [REQUIRED]
```

**Example**

```
list_instance.findBy("name", "@soyjavi");
```

#### .select()
Este método específico para la gestión de entidades sirve para filtrar los elementos por una determinada función.

**Parameters**

```
callback: Function [REQUIRED]
```

**Example**

```
filterByFollowers = function(entity) {
  if (entity.followers > 1000) {
    return entity;
  }
};
list_instance.select(filterByFollowers);
```

#### .all()
Este método específico para la gestión de entidades sirve mostrar todos los elementos de una lista.

#### .clean()
Este método sirve para eliminar todos los hijos contenidos en el elemento.

### Events

#### select
Cualquier instancia puede desplegar el evento *select* cuando se pulsa sobre un elemento "hijo".