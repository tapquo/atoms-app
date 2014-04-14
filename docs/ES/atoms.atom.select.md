## Atom.Select
Elemento que representa una entrada de valor de tipo lista en nuestra interfaz.

### Attributes

```
name       : [REQUIRED]
options    : [OPTIONAL]
id         : [OPTIONAL]
value      : [OPTIONAL]
required   : true|false [OPTIONAL]
disabled   : true|false [OPTIONAL]
style      : tiny|small|big [OPTIONAL]
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
select_instance.value("atoms");

value = select_instance.value();
console.log(value);
> "atoms"
```

### Events

#### change
Cualquier instancia puede desplegar el evento *change* cuando el valor cambia.