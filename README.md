# Uptime Monitors ELK - Docker Service

Supervise la disponibilidad de los servicios con sondeo activo. Dada una lista de URL, Heartbeat hace una simple pregunta: ¿Estás vivo?
Envia la informacion a su Elastic y se muetras en kibana

## Iniciar Servicio de Monitoreo
- Abriri Carpeta del Proyecto 
```bash
  cd /monitoreo/servicio
```
- Editar heartbeat.yml y cambiar los datos del indice
```bash
  vim heartbeat.yml
```
- Editar buildear la imagen del nuevo servicio
```bash
  docker build -t heartbeat-image .
```
- Editar arrancar el servicio con la nueva imagen
```bash
  docker run --name heartbeat-servicio -d heartbeat-image
```
- para dejar de mandar datos eliminar el contenedor
```bash
  docker rm -f heartbeat-servicio
```
