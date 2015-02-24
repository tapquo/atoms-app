## Organism.Dialog
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
dialog_instance.show();
```


#### .hide()
Este método te permite mostrar un determinado *Organism.Aside*:

**Example**

```
dialog_instance.hide();
```


### Events

En este tipo de elementos no tiene ningún sentido el sistema de eventos *Bubble* ya que no tiene ningun elemento padre, por lo tanto la suscripción a los eventos se realizará de la siguiente manera:

```
dialog_instance.bind(NAME_OF_EVENT, function(event) {
  /* Your code */
});
```

#### show
Cualquier instancia puede desplegar el evento *show* cuando se muestra la propia instancia.


#### hide
Cualquier instancia puede desplegar el evento *hide* cuando se oculta la propia instancia.

### Dialog especiales
Existen dos tipos de dialog que son especiales en cuanto a su estilo y funcionalidad. Uno de ellos es el dialog **loading** y el otro el dialog **push**.
<br>
<br>
Es primero es para usarse cuando se está esperando a que se cargue algo.
```
__.Dialog.Loading.show()
```

El segundo se usa para enviar una mensaje push y hay que enviarle los atributos que se quieren mostrar:

```
__.Dialog.Push.show({title: "push_title", description: "push_text", image: "push_image"})
```
