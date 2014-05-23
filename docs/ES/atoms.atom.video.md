## Atom.Video
Elemento que gestiona la etiqueta html `<video/>`, este puede ser contenido en el organismo Organism.Section.

### Attributes

```
id       : [OPTIONAL]
controls : boolean [OPTIONAL]
preload  : boolean [OPTIONAL]
autoplay : boolean [OPTIONAL]
loop     : boolean [OPTIONAL]
src      : string [OPTIONAL]
```

### Methods

#### .src()
Este método te servirá para establecer la url del video a reproducir, puedes asignar tambien el tipo de video.

**Parameters**

```
url  : String [REQUIRED]
type : String [OPTIONAL] [DEFAULT "video/mpeg"]
```

**Example**

```
video_instance.src("http://myserver.com/video/song.mp3");
video_instance2.src("http://myserver.com/video/song.wav", "video/wav");
```

#### .play()
Este método te servirá para comenzar la reproducción de el video asignado al átomo.

**Example**

```
video_instance.play();
```

#### .stop()
Este método te servirá para parar la reproducción de el video asignado al átomo.

**Example**

```
video_instance.stop();
```

#### .pause()
Este método te servirá para pausar la reproducción de el video asignado al átomo.

**Example**

```
video_instance.pause();
```

#### .volumen()
Este método te servirá para establecer y obtener el porcentaje del volumen de la reproducción de el video asignado al átomo.

**Example**

```
video_instance.volume();
> 50

video_instance.volumen(75);
video_instance.volume();
> 75
```

#### .time()
Este método te servirá para establecer y obtener el tiempo actual en segundos de la reproducción de el video asignado al átomo.

**Example**

```
video_instance.time();
> 10.239238283

video_instance.time(20);
video_instance.time();
> 20.23823
```

#### .duration()
Este método te servirá para conocer el tiempo total en segundos de la reproducción de el video asignado al átomo.

**Example**

```
video_instance.duration();
> 123.23823981
```

### Events

#### load
Cuando la instancia actual, una vez establecido el atributo src, ha cargado el suficiente *buffer* para poder ser reproducido desplegará el evento *Bubble.Load*.

#### error
Cuando la instancia actual, una vez establecido el atributo src, no ha conseguido cargar el recurso desplegará el evento *Bubble.Error*.

#### downloading
Mientras la instancia actual este descargando el *buffer* para poder ser reproducido desplegará el evento *Bubble.Downloading*.

#### play
Cualquier instancia de botón desplega el evento *Bubble.Play* cuando comienza la reproducción de un video.

#### timing
Cualquier instancia desplega el evento *Bubble.timing* cada 250ms devolviendo el tiempo actual de reproducción.

#### pause
Cualquier instancia de botón desplega el evento *Bubble.Pause* cuando se pausa la reproducción de un video.

#### end
Cualquier instancia de botón desplega el evento *Bubble.End* cuando termina la reproducción de un video.
