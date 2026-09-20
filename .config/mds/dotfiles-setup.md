# Guía de Configuración y Restauración de Dotfiles

Esta guía explica cómo restaurar y gestionar estos archivos de configuración (*dotfiles*) en un sistema operativo nuevo utilizando un repositorio **bare** de Git.

---

## Paso 1: Clonar e Instalar en una Computadora Nueva

Cuando estés en una máquina nueva y quieras aplicar todos estos archivos de configuración en tu carpeta personal (`~`), ejecuta los siguientes comandos en tu terminal:

### 1. Crear el alias temporal
```console
$ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

### 2. Evitar conflictos de recursión
Asegúrate de ignorar la carpeta de la base de datos de Git:
```console
$ echo ".cfg" >> ~/.gitignore
```

### 3. Clonar el repositorio en modo *bare*
```console
$ git clone --bare https://github.com:deemiann/dotfiles-arch.git $HOME/.cfg
```

---

## Paso 2: Aplicar la Configuración

Descarga y deposita los archivos en tu carpeta `~`:
```console
$ config checkout
```

### ¿Qué hacer si hay conflictos con archivos existentes?
Si la instalación limpia del SO ya creó archivos como `~/.bashrc`, el comando `config checkout` dará un error de sobreescritura. 

Para mover automáticamente los archivos conflictivos a una carpeta de respaldo y reintentar, ejecuta:
```console
$ mkdir -p .config-backup
$ config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
$ config checkout
```
---

## Paso 3: Post-Instalación

### 1. Ocultar archivos no rastreados
Evita que `config status` muestre todos los archivos no guardados de tu sistema:
```console
$ config config --local status.showUntrackedFiles no
```

### 2. Recargar tu entorno
Asegúrate de que tu alias `config` quede guardado permanentemente (el `.bashrc` descargado ya debería incluirlo):
source ~/.bashrc

---

## Uso Diario (Comandos Frecuentes)

A partir de ahora, usa el comando `config` exactamente igual que usarías `git`:

* **Ver estado de archivos modificados:**
```console
$ config status
```

* **Añadir un archivo nuevo:**
```console
$  config add ~/.bashrc
```

* **Guardar cambios:**
```console
$ config commit -m "Actualizar alias y variables"

```
* **Subir a la nube:**
```console
$ config push
```
