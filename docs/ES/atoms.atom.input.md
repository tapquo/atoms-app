## Atom.Input
Elemento que representa una entrada de valor en nuestra interfaz.

### Attributes

```
type       : String text|password|number|date|datetime|email|search|tel|time|url [REQUIRED]
name       : String [REQUIRED]
id         : String [OPTIONAL]
value      : String [OPTIONAL]
placeholder: String [OPTIONAL]
required   : Boolean [OPTIONAL]
disabled   : Boolean [OPTIONAL]
style      : String tiny|small|big [OPTIONAL]
maxlength  : Number [OPTIONAL]
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

#### .error()
Este método te servirá para establecer la clase CSS "error" para el caso que necesites marcar como una entrada invalida, o para como veremos con Molecule.Form gestione los elementos con atributo required.

**Parameters**

```
value    : Boolean [REQUIRED]
focus    : Boolean[OPTIONAL - DEFAULT: True]
```

**Example**

```
input_instance.error(true);
input_instance.el.hasClass("error");
> true

input_instance.error(false, false);
input_instance.el.hasClass("error");
> false
```

### Events

#### keypress
Cualquier instancia puede desplegar el evento *keypress* cuando se inicia la introducción de un caracter.

#### keyup
Cualquier instancia puede desplegar el evento *keyup* cuando se finaliza la introducción de un caracter.

#### change
Cualquier instancia puede desplegar el evento *change* cuando el valor cambia.