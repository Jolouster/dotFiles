---
date: mayo 2020
author: Jonathan López
---

# Setup de mi sistema Debian

## ¿Esto qué es?

Es el lugar donde guardo el script que uso para instalar todos los programas que uso en mi día a día y sus dependencias.

Es el lugar donde guardo todos los archivos de configuración que personalizo en mi sistema operativo Debian.

De esta manera si tengo que reinstalar el sistema operativo, me cambio de portátil o quiero "copiar" mi entorno en cualquier otro ordenador con Debian, solo tengo que descargar este repositorio ejecutar el script `setupMyConfig.sh`, ir a por un café y esperar a que termine.

Básicamente es otro repositorio típico de "dotFiles" que incluye la instalación de unos pocos programas mediante un script. Sin usar programas auxiliares ni herramientas de terceros.

## ¿Cómo funciona?

Dar permisos de ejecución.


## ¿Para quién es?

Principalmente lo he hecho para mi mismo. 

Soy programador y me gusta programar. Me aburre perder el tiempo instalando y configurando todos mis programas una y otra vez. Así que he automatizado la puesta en marcha de mi sistema.

Busco: 

* Que sea simple.
* Sencillo de ampliar y personalizar.
* Minimizar el número de herramientas auxiliares. Git, bash y a correr. 

Si te gusta la idea **y tienes nociones básicas de bash scripting** te puede servir de base para crear tu propio sistema automatizado para personalizar cualquier instalación "virgen" y "pelada" de Debian.

No deberías ejecutar ningún script descargado de internet sin entenderlo bien antes.

Se ha intentado que el script sea lo más sencillo posible y que sea fácil de leer y entender. Si no entiendes ni papa, mejor no lo toques ni lo uses (a no ser que lo quieras usar para aprender bash scripting...).

## ¿Cómo te puedes beneficiar de este repositorio?

Descarga el repositorio. Abre el script `setupMyConfig.sh` y lee lo que hace.

Verás que está dividido por secciones. Cada una de ellas hace una cosa muy concreta. Añade, cambia, elimina o modifica a tu gusto para que instale y configure como tu deseas.

En la ultima parte se enlazan los archivos de configuración con las rutas que corresponde.

## Manejo de notas desde la terminal

### Notas siguiendo el método Zettelkasten.

En `myBashrc.sh` se define la variable: `PATH_TO_NOTES` que define dónde guardo mis notas. 

En mi caso se trata de una carpeta dentro de Dropbox. Pero cada uno debería personalizarla.

Para mis notas uso una plantilla que contiene metadatos como fecha de creación, nombre del autor y correo electrónico, titulo, una línea para la frase descriptiva, otra línea para anotar la fuente bibliográfica y otra línea al final para las etiquetas. La variable que determina donde se encuentra esta plantilla es `HEADER_TEMPLATE`

Para crear una nota nueva simplemente tengo que ejecutar el siguiente comando desde cualquier lugar:

```bash
netNote "Titulo de mi nueva nota"
```

Con esto se crea una nota con un ID único basado en la fecha y hora actuales del sistema y el titulo indicado. Algo como esto: `202012271330-Titulo-de-mi-nueva-nota.md` en la carpeta especificada en `PATH_TO_NOTES` y se abre automáticamente en el editor Neovim.

### Creación de entradas en el diario personal

En la variable `PATH_TO_JOURNAL` se define dónde guardo las entradas del diario. Cada cual debe personalizarla. También uso una plantilla que me ayuda y guía para escribir. Me cuesta hacer el hábito y para hacer frente a la hoja en blanco me va bien.

Para crear una nueva entrada ejecuto los siguiente desde la línea de comandos:

```bash
newDay
```

Con esto me abre el editor Neovim en una nueva entrada de mi diario. El archivo generado se identifica por el ID único basado en fecha y hora seguido del sufijo `-diario.md`.

### Notas rápidas

Esta función crea un archivo por día. Cada vez que se llama a esta función abre el archivo de este día y si no existe aun lo crea. Cada nota rápida se separa del resto por medio de un encabezado de nivel 2 con la hora actual.

Como en los otros casos el editor usado es Neovim.

Hay dos maneras de usarlo:

1. Abrir el editor para escribir lo que uno quiera.

```bash
qnote
```

2. Incluir una frase o una oración breve en las nota rápida.

```bash
qnote Revisar el blog jolouster.com más tarde. Info sobre programación.
```

