# Uptime Monitors ELK - Docker Service

Supervise la disponibilidad de los servicios con sondeo activo. Dada una lista de URL, Heartbeat hace una simple pregunta: ¿Estás vivo?
Envia la informacion a su Elastic y se muetras en kibana

## Iniciar Servicio de Monitoreo
- Clonamos el repo
```bash
  git clone 
```
- Editar heartbeat.yml, agregamos los datos del servidor elastic y kibana, agregamos los servicios que queremos monitorear
```bash
  vim heartbeat.yml
  
# =================================== Kibana ===================================
#Host kibana HTTPS
  #host: "https://localhost:5601"
  #ssl.verification_mode: none
#Host kibana HTTP
  #host: "localhost:5601"
  
  
 # ---------------------------- Elasticsearch Output ----------------------------
#Host Elasticsearch HTTPS
#output.elasticsearch:
  #hosts: ["localhost:9200"]
  #protocol: "https"
  #ssl.verification_mode: none
  #username: "elastic"
  #password: "changeme"
  #index: "index_name%{+yyyy.MM.dd}"

#Host Elasticsearch HTTP
#output.elasticsearch:
  #hosts: ["localhost:9200"]
  #protocol: "http"
  #username: "elastic"
  #password: "changeme"

  
```
- Editar heartbeat.yml para agregamos los servicios que queremos monitorear
```bash
  heartbeat.monitors:
      - type: icmp
      id: service-ping
      name: service-ping
      hosts: ["service.com"]
      schedule: '*/5 * * * * * *'
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
