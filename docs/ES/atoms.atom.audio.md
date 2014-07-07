## Atom.Audio
Elemento que gestiona la etiqueta html `<audio/>`, este puede ser contenido en  Organism.Section.

### Attributes

```
id       : String [OPTIONAL]
src      : String [OPTIONAL]
controls : Boolean [OPTIONAL]
preload  : Boolean [OPTIONAL]
autoplay : Boolean [OPTIONAL]
loop     : Boolean [OPTIONAL]
```

### Methods

#### .src()
Este método te servirá para establecer la url del audio a reproducir, puedes asignar tambien el tipo de audio.

**Parameters**

```
url  : String [REQUIRED]
type : String [OPTIONAL] [DEFAULT "audio/mpeg"]
```

**Example**

```
audio_instance.src("http://myserver.com/audio/song.mp3");
audio_instance2.src("http://myserver.com/audio/song.wav", "audio/wav");
```

#### .play()
Este método te servirá para comenzar la reproducción de el audio asignado al átomo.

**Example**

```
audio_instance.play();
```

#### .stop()
Este método te servirá para parar la reproducción de el audio asignado al átomo.

**Example**

```
audio_instance.stop();
```

#### .pause()
Este método te servirá para pausar la reproducción de el audio asignado al átomo.

**Example**

```
audio_instance.pause();
```

#### .volumen()
Este método te servirá para establecer y obtener el porcentaje del volumen de la reproducción de el audio asignado al átomo.

**Example**

```
audio_instance.volume();
/* 50 */

audio_instance.volumen(75);
audio_instance.volume();
/* 75 */
```

#### .time()
Este método te servirá para establecer y obtener el tiempo actual en segundos de la reproducción de el audio asignado al átomo.

**Example**

```
audio_instance.time();
/* 10.239238283 */

audio_instance.time(20);
audio_instance.time();
/* 20.23823 */
```

#### .duration()
Este método te servirá para conocer el tiempo total en segundos de la reproducción de el audio asignado al átomo.

**Example**

```
audio_instance.duration();
/* 123.23823981 */
```

### Events

#### load
Cuando la instancia actual, una vez establecido el atributo src, ha cargado el suficiente *buffer* para poder ser reproducido desplegará el evento *Bubble.Load*.

#### error
Cuando la instancia actual, una vez establecido el atributo src, no ha conseguido cargar el recurso desplegará el evento *Bubble.Error*.

#### downloading
Mientras la instancia actual este descargando el *buffer* para poder ser reproducido desplegará el evento *Bubble.Downloading*.

#### play
Cualquier instancia de botón desplega el evento *Bubble.Play* cuando comienza la reproducción de un audio.

#### timing
Cualquier instancia desplega el evento *Bubble.timing* cada 250ms devolviendo el tiempo actual de reproducción.

#### pause
Cualquier instancia de botón desplega el evento *Bubble.Pause* cuando se pausa la reproducción de un audio.

#### end
Cualquier instancia de botón desplega el evento *Bubble.End* cuando termina la reproducción de un audio.
