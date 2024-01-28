FROM postgres:13

# Definimos as varaiveis de ambiente para o postgres
ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=root
ENV POSTGRES_DB=my_taxi_data
ENV POSTGRES_HOST_AUTH_METHOD=trust

# Criamos a pasta de dados do postgres dentro do container
RUN mkdir -p /var/lib/postgresql/data

# Marcamos a pasta de dados do postgres do container com o volume (local)
VOLUME postgres_data : /var/lib/postgresql/data

# Configuramos a porta de acesso ao postgres
EXPOSE 5432

# Init do postgres
CMD ["postgres"]
