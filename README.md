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

