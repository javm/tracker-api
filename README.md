# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# tracker-api
## Endpoints:
GET /track/:provider?package=paqueteTrackID
** Obtenemos el status del paquete con número de rastreo paqueteTrackID y para el provider :provider. ej. (GET /track/fedex=package=122324)

Para obtener el status de un paquete
