## YouTube Downloader Bash

Este script de Bash permite descargar videos de YouTube en diferentes formatos (mp3 o mp4) de manera interactiva, utilizando la herramienta `zenity` para la selección de la carpeta de destino y la entrada de la URL del video, así como para mostrar mensajes al usuario.

### Requisitos

- `zenity`: Una utilidad para la creación de diálogos gráficos.
- `youtube-dl`: Un programa de línea de comandos para descargar videos de YouTube y otros sitios.

### Instalación de dependencias

1. Asegúrate de tener instalado `youtube-dl` y `zenity`. Puedes instalarlos ejecutando:

    ```bash
    sudo apt-get install youtube-dl zenity
    ```

### Uso

1. Descarga el script `youtube_downloader.sh` y dale permisos de ejecución:

    ```bash
    chmod +x youtube_downloader.sh
    ```

2. Ejecuta el script en un terminal.

3. Selecciona la carpeta de destino para guardar las descargas.

4. Ingresa la URL del video de YouTube que deseas descargar.

5. Selecciona el formato de descarga (mp3 o mp4).

6. Repite el proceso para descargar más videos, o escribe "salir" para finalizar.

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
