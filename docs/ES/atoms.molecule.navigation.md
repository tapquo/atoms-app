## Molecule.Navigation
Elemento que representa un menú de navegación con átomos del tipo *Button* o *Link*, además de que si uno de sus hijos tiene el atributo `path` desplegará el sistema de enrutamiento de Atoms. Puede ser contenido en *Organism.Header*, *Organism.Section* y *Organism.Footer*.

### Attributes

```
id    : String [OPTIONAL]
style : String [OPTIONAL]
```

### Events

#### select
Cualquier instancia puede desplegar el evento *select* cuando se pulsa sobre un elemento "hijo".