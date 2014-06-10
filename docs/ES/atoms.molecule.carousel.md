## Molecule.Carousel
Elemento que representa un carousel de elementos, en este caso acepta los elementos *Atom.Figure*, *Atom.Image* y *Atom.Video*.

### Attributes

```
id      : String [OPTIONAL]
style   : tiny|small|big String [OPTIONAL]
interval: Number [OPTIONAL]
```

### Events

#### initialize
Inicializa la instancia actual, asignando el orden de cada elemento y activando, en el caso de que se haya establecido un *interval*, el paso automático de elmentos.

```
carousel_instance.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/javi.jpg"
carousel_instance.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/oihane.jpg"
carousel_instance.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/cata.jpg"
carousel_instance.appendChild "Atom.Figure", url: "http://cdn.tapquo.com/photos/jany.jpg"
carousel_instance.initialize()
```

#### clean
Elimina todo el contenido de la instancia (internamente llama al método *destroyChildren*).

```
carousel_instance.clean()
```

#### next
Muestra el siguiente elemento de la instancia actual.

```
carousel_instance.next()
```

#### previous
Muestra el elemento anterior de la instancia actual.

```
carousel_instance.previous()
```


### Events

#### start
Cualquier instancia puede desplegar el evento *start* cuando se inicializa.

#### change
Cualquier instancia puede desplegar el evento *change* cuando se muestra un contenido, ya sea utilizando los métodos *next*, *previous* o de manera automática con el atributo *interval*.

#### end
Cualquier instancia puede desplegar el evento *end* cuando se ha alcanzado el último elemento que mostrar.
