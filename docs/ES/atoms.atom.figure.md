## Atom.Figure
Elemento que representa una figura, ilustración o imagen en nuestra interfaz; puede añadirse al Organism.Section.


### Attributes

```
url  : String [REQUIRED]
id   : String [OPTIONAL]
style: String tiny|small|big|fluid [OPTIONAL]
```

### Events

#### touch
Cualquier instancia puede desplegar el evento *Bubble.Touch* cuando es pulsado.

#### tap
Cualquier instancia puede desplegar el evento *Bubble.Touch* cuando se realiza un pulsado largo.

#### hold
Cualquier instancia puede desplegar el evento *hold* cuando se pulsa durante más de 650 milisegundos.

#### swipe
Cualquier instancia puede desplegar el evento *swipe* cuando se arrastra el dedo en cualquier dirección. 

#### rotate
Cualquier instancia puede desplegar el evento *rotate* cuando se genera una rotación con varios dedos.