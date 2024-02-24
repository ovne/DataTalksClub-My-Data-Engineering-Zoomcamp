/*
  As tabelas solicitadas para o projeto estão disponíveis no conjunto de dados públicos do BigQuery.

  Então, um atalho para carregar os dados solicitados para um dataset pessoal seria copiar os dados 
  direto do conjunto de dados públicos do BQ.

  Abaixo temos os comandos SQL para serem executados direto no editor de query BigQuery para
  cuidar dessa tarefa.

  1 - Certifique-se de substituir 'projeto-estudos-356715' pelo id do seu projeto GCP
  2 - Certifique-se de substituir 'zoomcamp_ny_taxi_data' pelo nome do seu dataset
  3 - Recomenda-se executar os comandos SQL um por vez, pois o BigQuery pode reclamar de muitas alterações na tabela
*/

CREATE TABLE  `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata` AS
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2019`; 


CREATE TABLE  `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata` AS
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`;

insert into  `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata` 
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2020` ;


insert into  `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata` 
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2020`; 

  -- Fixes yellow table schema
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN vendor_id TO VendorID;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN pickup_datetime TO tpep_pickup_datetime;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN dropoff_datetime TO tpep_dropoff_datetime;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN rate_code TO RatecodeID;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN imp_surcharge TO improvement_surcharge;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN pickup_location_id TO PULocationID;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.yellow_tripdata`
  RENAME COLUMN dropoff_location_id TO DOLocationID;

  -- Fixes green table schema
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN vendor_id TO VendorID;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN pickup_datetime TO lpep_pickup_datetime;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN dropoff_datetime TO lpep_dropoff_datetime;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN rate_code TO RatecodeID;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN imp_surcharge TO improvement_surcharge;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN pickup_location_id TO PULocationID;
ALTER TABLE `projeto-estudos-356715.zoomcamp_ny_taxi_data.green_tripdata`
  RENAME COLUMN dropoff_location_id TO DOLocationID;
