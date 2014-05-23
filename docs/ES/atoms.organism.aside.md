## Organism.Aside
Al igual que el *Organism.Article* es un elemento contenedor padre donde se contendrán todos los subelementos (organismos, moleculas y átomos). Por tanto tienes que tomar al *Organism.Aside* como un lienzo para un menu adicional en tu aplicación donde podrás definir otros organismos dentro de el como pueden ser: *Header*, *Footer*, *Section*...

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
aside_instance.show();
```


#### .hide()
Este método te permite mostrar un determinado *Organism.Aside*:

**Example**

```
aside_instance.hide();
```


### Events

En este tipo de elementos no tiene ningún sentido el sistema de eventos *Bubble* ya que no tiene ningun elemento padre, por lo tanto la suscripción a los eventos se realizará de la siguiente manera: 

```
aside_instance.bind(NAME_OF_EVENT, function(event) {
  /* Your code */
});
```

#### show
Cualquier instancia puede desplegar el evento *show* cuando se muestra la propia instancia.


#### hide
Cualquier instancia puede desplegar el evento *hide* cuando se oculta la propia instancia.