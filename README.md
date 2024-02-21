## YouTube Downloader

Este script de Bash permite descargar videos de YouTube en diferentes formatos (mp3 o mp4) de manera interactiva, utilizando la herramienta `zenity` para la selección de la carpeta de destino y la entrada de la URL del video, así como para mostrar mensajes al usuario.

### Requisitos

- `zenity`: Una utilidad para la creación de diálogos gráficos.
- `youtube-dl`: Un programa de línea de comandos para descargar videos de YouTube y otros sitios.

### Uso

1. Ejecuta el script en un terminal.
2. Selecciona la carpeta de destino para guardar las descargas.
3. Ingresa la URL del video de YouTube que deseas descargar.
4. Selecciona el formato de descarga (mp3 o mp4).
5. Repite el proceso para descargar más videos, o escribe "salir" para finalizar.

### Instrucciones de Instalación

1. Asegúrate de tener instaladas las dependencias necesarias: `zenity` y `youtube-dl`.
2. Descarga el script `youtube_downloader.sh`.
3. Abre un terminal y navega hasta el directorio donde se encuentra el script.
4. Ejecuta el script utilizando el comando `bash youtube_downloader.sh`.

### Ejemplo de Uso

```bash
bash youtube_downloader.sh
```

### Notas

- Las descargas se guardarán en la carpeta seleccionada como destino.
- El script muestra el progreso de la descarga en la terminal.
- Una vez que todas las descargas estén completadas, se mostrará un mensaje informativo con la ubicación de las descargas.

### Advertencia

Este script depende de herramientas externas y servicios en línea, como YouTube. Asegúrate de tener permiso para descargar y utilizar los contenidos de acuerdo con los términos de servicio de YouTube y las leyes de derechos de autor aplicables. El mal uso de este script puede infringir los derechos de autor y otras leyes. Utilízalo bajo tu propio riesgo.

### Autor

Este script fue creado por [autor](https://github.com/Argon69).

### Licencia

Este proyecto está bajo la licencia [Licencia](LICENSE).
