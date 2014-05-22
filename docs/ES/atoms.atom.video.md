## Atom.Video
Elemento que representa un reproductor de video, este puede ser contenido en el organismo [Molecule.Section](http://).


### Attributes

```
id       : [OPTIONAL]
controls : boolean [OPTIONAL]
preload  : boolean [OPTIONAL]
autoplay : boolean [OPTIONAL]
loop     : boolean [OPTIONAL]
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
audio_instance.url("http://myserver.com/audio/song.mp3");
audio_instance2.url("http://myserver.com/audio/song.wav", "audio/wav");
```

#### .play()
Este método te servirá para comenzar la reproducción de el audio asignado al átomo.

**Example**

```
input_instance.play();
```

#### .stop()
Este método te servirá para parar la reproducción de el audio asignado al átomo.

**Example**

```
input_instance.stop();
```

#### .pause()
Este método te servirá para pausar la reproducción de el audio asignado al átomo.

**Example**

```
input_instance.pause();
```

### Events

#### play
Cualquier instancia de botón desplega el evento *Bubble.Play* cuando comienza la reproducción de un audio.

#### pause
Cualquier instancia de botón desplega el evento *Bubble.Pause* cuando se pausa la reproducción de un audio.

#### end
Cualquier instancia de botón desplega el evento *Bubble.End* cuando termina la reproducción de un audio.

#### progress
Cualquier instancia de botón desplega el evento *Bubble.Progress* cada 250ms mientras se reproduce un audio.