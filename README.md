# Iniciar Servicio de Monitoreo con docker
- Abrir o Crear Carpeta del Proyecto 
```bash
  cd /monitoreo/servicio
```
- Editar heartbeat.yml y cambiar los datos del indice
```bash
  vim heartbeat.yml
```
- Buildear la imagen del nuevo servicio
```bash
  docker build -t heartbeat-image .
```
- Arrancar el servicio con la nueva imagen
```bash
  docker run --name heartbeat-image -d heartbeat-servicio
```
- Para dejar de mandar datos eliminar el contenedor
```bash
  docker rm -f heartbeat-servicio
```
