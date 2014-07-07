## Atom.Switch
Elemento que representa una entrada de valor de tipo booleana en nuestra interfaz, podrá ser incluido dentro del Molecule.Form.

### Attributes

```
name       : String [REQUIRED]
id         : String [OPTIONAL]
value      : Boolean [OPTIONAL]
required   : Boolean [OPTIONAL]
disabled   : Boolean [OPTIONAL]
style      : String tiny|small|big [OPTIONAL]
```

### Methods

#### .value()
Este método te servirá para establecer un valor en el elemento o para recoger el que tenga asignado.

**Parameters**

```
value    : String|Number [OPTIONAL]
```
**Example**

```
switch_instance.value(true);

value = switch_instance.value();
console.log(value);
/* true */
```

### Events


#### changed
Cualquier instancia puede desplegar el evento *Bubble.Changed* cuando el valor cambia.
