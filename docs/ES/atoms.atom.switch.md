## Atom.Switch
Elemento que representa una entrada de valor de tipo booleana en nuestra interfaz.

### Attributes

```
name       : [REQUIRED]
id         : [OPTIONAL]
value      : true|false [OPTIONAL]
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
switch_instance.value(true);

value = switch_instance.value();
console.log(value);
> true
```

### Events


#### change
Cualquier instancia puede desplegar el evento *change* cuando el valor cambia.