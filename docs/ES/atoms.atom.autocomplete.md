## Atom.InputAutocomplete
Con este elemento se puede predecir el valor que está insertando el usuario.

### Atributos en el IDE

```
id          : String [OPTIONAL]
name        : String [REQUIRED]
placeholder : String [OPTIONAL]
value       : String [OPTIONAL]
maxlength   : Number [OPTIONAL]
```

### Atributos en el código
```
   options: Array object
```

### Ejemplo
```
- Atom.AutoComplete:
    placeholder: autocomplete...
    name: autocomplete
    options:
        - label: soyjavi
          value: 1
        - label: cataflu
          value: 2
        - label: oihane
         value: 3
        - label: tapquo
         value: 4

```
### Métodos

#### .value()
Este método te servirá para establecer un valor en el elemento o para recoger el que tenga asignado.

**Parameters**

```
value : String|Number [OPTIONAL]
```

**Example**

```
autocomplete.value("cataflu");

value = autocomplete.value();
console.log(value);
/* "cataflu" */
```

### Eventos

#### onAutoCompleteChange
Se desplega cuando se modifica el autocomplete.

#### onAutoCompleteSelect
Se desplega cuando se selecciona un valor del autocomplete.
