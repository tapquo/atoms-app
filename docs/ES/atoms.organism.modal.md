## Organism.Modal
Este elemento sirve para crear ventanas flotantes o mensajes de dialogo dentro de tu aplicación. Al igual que los organismos *Article* y *Aside* es un elemento contenedor padre donde se contendrán todos los subelementos (organismos, moleculas y átomos).

### Attributes

```
id    : String [REQUIRED]
style : String [OPTIONAL]
```

### Methods

#### .show()
Este método te permite mostrar un determinado *Organism.Aside*.

**Example**

```
modal_instance.show();
```


#### .hide()
Este método te permite mostrar un determinado *Organism.Aside*:

**Example**

```
modal_instance.hide();
```


### Events

En este tipo de elementos no tiene ningún sentido el sistema de eventos *Bubble* ya que no tiene ningun elemento padre, por lo tanto la suscripción a los eventos se realizará de la siguiente manera: 

```
modal_instance.bind(NAME_OF_EVENT, function(event) {
  /* Your code */
});
```

#### show
Cualquier instancia puede desplegar el evento *show* cuando se muestra la propia instancia.


#### hide
Cualquier instancia puede desplegar el evento *hide* cuando se oculta la propia instancia.