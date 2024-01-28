

  docker run -d \
    --name postgresDB \
    -e POSTGRES_PASSWORD=admin \
    -e POSTGRES_DB=ny_taxi_data \
    -v postgres_data:/var/lib/postgresql/data \
    -p 5432:5432 \
    postgres
  