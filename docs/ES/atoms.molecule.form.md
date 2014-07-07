## Molecule.Form
Elemento que representa un formulario de datos, puede contener los átomos *Label*, *Input*, *Textarea*, *Select*, *Switch* y *Button*. Esta molecula es capaz de controlar todos los valores introducidos y de señalar los que sean incorrectos o requeridos. Esta Molecule puede ser contenida en los Organism.Section.

### Attributes

```
id         : String [OPTIONAL]
style      : String [OPTIONAL]
```

### Methods

#### .value()
Este método recoge los valores de los elementos "hijo" (input, textarea, select, switch...) y genera un objeto con el par key/value como nombre de hijo y su valor con cada uno de sus hijos.

**Example**

```
form_instance.appendChild("Atom.Label", {text: "Fields"});
form_instance.appendChild("Atom.Input", {type: "text", name: "username", value: "@soyjavi", required: true});
form_instance.appendChild("Atom.Textarea", {name: "bio"}, value: "@tapquo founder");
form_instance.appendChild("Atom.Button", {text: "Save"});

value = form_instance.value();
console.log(value);
/* {name: "@soyjavi", bio: "@tapquo founder"} */
```

#### .clean()
Este método recorre todos los elementos "hijo" reestableciendo su valor a *null*.

**Example**

```
form_instance.clean();

value = form_instance.value();
console.log(value);
/* {name: ", bio: ""} */
```


### Events

#### change
Cualquier instancia puede desplegar el evento *change* cuando cambia el valor de cualquiera de los elementos "hijo".

#### submit [DEFAULT]
Cualquier instancia puede desplegar el evento *submit* cuando se pulsa sobre el botón de envio de formulario y todos los elementos "hijo" requeridos estan rellenados completamente.

#### error
Cualquier instancia puede desplegar el evento *error* cuando se pulsa sobre el botón de envio de formulario y alguno de los elementos "hijo" requeridos no estan rellenados correctamente.
