## Molecule.Search
Elemento que extiende de la clase *Molecule.Form* y que representa un buscador con los átomos *Input* y *Button*.

### Attributes

```
id    : [OPTIONAL]
style : [OPTIONAL]
```

### Methods

#### .value()
Este método recoge/establece el valor de búsqueda. 

**Parameters**

```
value    : String [OPTIONAL]
```

**Example**

```
search_instance.value("@soyjavi");

value = search_instance.value();
console.log(value);
> "@soyjavi"
```

### Events

#### change
Cualquier instancia puede desplegar el evento *change* cuando cambia el valor de la búsqueda.

#### submit [DEFAULT]
Cualquier instancia puede desplegar el evento *submit* cuando se pulsa sobre el botón de envio de formulario y el átomo *Input* esta rellenado correctamente.