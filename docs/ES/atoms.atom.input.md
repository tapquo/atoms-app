## Atom.Input
Elemento que representa una entrada de valor en nuestra interfaz.

### Attributes

```
type       : text|password|number|date|datetime|email|search|tel|time|url [REQUIRED]
name       : [REQUIRED]
id         : [OPTIONAL]
value      : [OPTIONAL]
placeholder: [OPTIONAL]
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
input_instance.value("atoms");

value = input_instance.value();
console.log(value);
> "atoms"
```

### Events

#### keypress
Cualquier instancia puede desplegar el evento *keypress* cuando se inicia la introducción de un caracter.

#### keyup
Cualquier instancia puede desplegar el evento *keyup* cuando se finaliza la introducción de un caracter.

#### change
Cualquier instancia puede desplegar el evento *change* cuando el valor cambia.