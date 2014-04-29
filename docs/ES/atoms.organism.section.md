## Organism.Section
Este elemento contiene las moleculas y atomos necesarios para construir una Aplicación: formularios, listas, imágenes, mapas...

### Attributes

```
id    : [REQUIRED]
style : [OPTIONAL]
```

### Methods

#### .show()
Este método te permite mostrar un determinado *Organism.Section*:

**Example**

```
section_instance.show();
```


#### .hide()
Este método te permite mostrar un determinado *Organism.Section*:

**Example**

```
section_instance.hide();
```


#### .refresh()
Este método te permite eliminar el estado desplegado por el evento *pull*:

**Example**

```
section_instance.refresh();
```


### Events

#### show
Cualquier instancia puede desplegar el evento *show* cuando se muestra la propia instancia.


#### hide
Cualquier instancia puede desplegar el evento *hide* cuando se oculta la propia instancia.


#### scroll
Cualquier instancia puede desplegar el evento *scroll*  cuando se hace scroll sobre la misma, el evento devuelve un objeto de la siguiente manera:

```
height  : "Tamaño de la seccion"
scroll  : "Scroll actual en pixels"
percent : "Porcentaje"
```


#### pull
Cualquier instancia puede desplegar el evento *pull* cuando se arrastra el dedo verticalmente y hacia abajo cuando nos encontramos en el scroll minimo
