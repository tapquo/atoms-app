## Atom.Progress
Elemento que representa una barra de progreso, este puede ser contenido tanto en Molecule.Form, Organism.Header, Organism.Section y Organism.Footer.


### Attributes

```
id    : String [OPTIONAL]
style : String tiny|small|big [OPTIONAL]
max   : Number [DEFAULT = 100]
value : Number [DEFAULT = 0]
```

### Methods

#### .value()
Este método te servirá para establecer el valor actual en la barra de progreso asi como para recoger el valor actual.

**Parameters**

```
value : number [OPTIONAL]
```

**Example**

```
progress = new Atoms.Atom.Progress({value: 10});

progress.value();
> 10

progress.value(25);
progress.value();
> 25
```
