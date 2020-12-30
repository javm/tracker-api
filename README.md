# README

# dependencies
* Ruby 2.7.0 >=
* Rails 6.0.2.1 >=
* Mongoid ~> 7.0
* Debian 10
# tracker-api
## Endpoints:
`GET /track/:provider?package=paqueteTrackID`

Obtenemos el status del paquete con número de rastreo paqueteTrackID con el proveedor 'provider' ej. ( `GET /track/fedex=package=122324  )

Para obtener el status de un paquete

## Run tests

 `rails test test/controllers/tracker_controller_test.rb

## Implementación para otro provider
1. Extiende la clase Shipper
2. Implementa `map_status`  
2.1 `include StatusReader`  
2.2 Al implementar `map_status`  para tu proveedor regresa un JSON de la siguiente forma:

  `{:provider_message => fedex_status, :status => status}`  
