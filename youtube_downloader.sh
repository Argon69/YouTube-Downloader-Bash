#!/bin/bash

# Manejo de señales
trap 'echo "Saliendo..."; exit 1' SIGINT SIGTERM

# Función para seleccionar el directorio de destino
seleccionar_destino() {
    local destino
    destino=$(zenity --file-selection --directory --title="Seleccione la carpeta de destino para guardar las descargas" 2>/dev/null)
    if [ -z "$destino" ]; then
        zenity --error --text="Carpeta no válida. Saliendo." 2>/dev/null
        exit 1
    fi
    echo "$destino"
}

# Verifica si youtube-dl está instalado
if ! command -v youtube-dl &> /dev/null; then
    zenity --error --text="youtube-dl no está instalado. Por favor, instálalo y vuelve a intentarlo." 2>/dev/null
    exit 1
fi

# Función para mostrar la barra de progreso de la descarga
mostrar_progreso() {
    local video_url="$1"
    local formato="$2"
    local destino="$3"

    echo "Descargando: $video_url en formato $formato..."

    # Descarga el video con youtube-dl y muestra la barra de progreso
    youtube-dl --output "$destino/%(title)s.%(ext)s" --extract-audio --audio-format mp3 --format mp4 --newline "$video_url" 2>&1 | while read -r linea; do
        porcentaje=$(echo "$linea" | grep -oE '[0-9]+([,.][0-9]+)?%')  # Extrae el porcentaje de la línea
        if [ -n "$porcentaje" ]; then
            echo "$porcentaje"
        fi
    done | zenity --progress --title="Descarga en progreso" --text="Descargando: $video_url en formato $formato..." --auto-close --percentage=0 --no-cancel

    echo -e "\nDescarga completada: $video_url en formato $formato"
}

# Bucle para permitir la descarga de múltiples archivos
while true; do
    # Utiliza zenity para obtener la URL del video de YouTube
    video_url=$(zenity --entry --title="Descargar Contenido" --text="Introduce la URL del video de YouTube (o 'salir' para terminar):" 2>/dev/null)

    # Verifica si se proporcionó una URL
    if [ -z "$video_url" ]; then
        zenity --error --text="URL no válida. Inténtalo de nuevo." 2>/dev/null
        continue
    elif [ "$video_url" == "salir" ]; then
        break
    fi

    # Selecciona el destino solo si aún no se ha seleccionado
    if [ -z "$destino" ]; then
        destino=$(seleccionar_destino)
    fi

    # Utiliza zenity para obtener el formato de descarga elegido por el usuario (mp3 o mp4)
    formato=$(zenity --list --title="Formato de Descarga" --text="Selecciona el formato de descarga para $video_url:" --radiolist \
        --column="Seleccionar" --column="Formato" TRUE "mp3" FALSE "mp4" 2>/dev/null)

    # Verifica si el formato seleccionado es válido
    if [ -z "$formato" ]; then
        zenity --error --text="Formato no válido. Inténtalo de nuevo." 2>/dev/null
        continue
    fi

    # Inicia la descarga en segundo plano
    mostrar_progreso "$video_url" "$formato" "$destino" &
done

# Espera a que todas las descargas en segundo plano terminen
wait

zenity --info --text="Todas las descargas completadas. Las descargas se encuentran en: $destino" 2>/dev/null
