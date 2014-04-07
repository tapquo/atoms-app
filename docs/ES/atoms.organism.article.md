## Organism.Article
Es el elemento contenedor padre donde se contendrán todos los subelementos (organismos, moleculas y átomos). Por tanto lo tienes que tomar al *Organism.Article* como el lienzo de tu aplicación donde podrás definir otros organismos dentro de el como pueden ser: *Header*, *Footer*, *Section*...

### Attributes

```
id    : [REQUIRED]
style : [OPTIONAL]
```

### Methods

#### .section()
Este método te permite mostrar un determinado *Organism.Section* contenido en el elemento *Article*.

**Parameters**

```
id: String [REQUIRED]
```

**Example**

```
article_instance.section("form");
> Shows section with id 'form' if exists.
```


#### .aside()
Este método te permite mostrar un determinado *Organism.Aside*:

**Parameters**

```
id: String [REQUIRED]
```

**Example**

```
article_instance.aside("options");
> Shows aside with id 'options' if exists.
```


### Events

En este tipo de elementos no tiene ningún sentido el sistema de eventos *Bubble* ya que no tiene ningun elemento padre, por lo tanto la suscripción a los eventos se realizará de la siguiente manera: 

```
article_instance.bind(NAME_OF_EVENT, function(event) {
  /* Your code */
});
```

#### show
Cualquier instancia puede desplegar el evento *show* cuando se muestra la propia instancia.


#### hide
Cualquier instancia puede desplegar el evento *hide* cuando se oculta la propia instancia.