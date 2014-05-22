## Atom.Progress
Elemento que representa una barra de progreso, este puede ser contenido tanto en el organismo *Organism.Section* como en *Molecule.Form*.


### Attributes

```
id    : [OPTIONAL]
style : tiny|small|big [OPTIONAL]
max   : number [DEFAULT = 100]
value : number [DEFAULT = 0]
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
