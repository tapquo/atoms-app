## Atom.Textarea
Elemento que representa una entrada de valor de texto en nuestra interfaz.

### Attributes

```
name       : String [REQUIRED]
id         : String [OPTIONAL]
value      : String [OPTIONAL]
placeholder: String [OPTIONAL]
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
textarea_instance.value("atoms");

value = textarea_instance.value();
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