
# # Prepare Postgres
# 
# Run Postgres and load data as shown in the videos
# We'll use the green taxi trips from September 2019:
# 
# ```wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz```
# 
# You will also need the dataset with zones:
# 
# ```wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv```
# 
# Download this data and put it into Postgres (with jupyter notebooks or with a pipeline)


import pandas as pd
from sqlalchemy import create_engine, text


green_taxi = "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz"
time_zones = "https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv"

df1 = pd.read_csv(
    filepath_or_buffer= green_taxi,
    compression="gzip",
    nrows=100
)

df2 = pd.read_csv(
    filepath_or_buffer= time_zones,
    nrows=100
)

df1.lpep_pickup_datetime = pd.to_datetime(df1.lpep_pickup_datetime)
df1.lpep_dropoff_datetime = pd.to_datetime(df1.lpep_dropoff_datetime)

dbengine = create_engine('postgresql://postgres:admin@localhost:5432')

df1.head(n=0).to_sql(
    name='green_taxi_data',
    con=dbengine,
    if_exists='replace'
)

# %%
# df2.head(n=0).to_sql(
#     name='time_zones',
#     con=dbengine,
#     if_exists='replace'
# )

iter_chunk = 100000

df1_iter = pd.read_csv(
    filepath_or_buffer= green_taxi,
    compression="gzip",
    iterator=True,
    chunksize=iter_chunk
)

# df2_iter = pd.read_csv(
#     filepath_or_buffer= time_zones,
#     iterator=True,
#     chunksize=iter_chunk
# )

while True:
    try:
        df_chunk = next(df1_iter)
        df_chunk.lpep_pickup_datetime = pd.to_datetime(df_chunk.lpep_pickup_datetime)
        df_chunk.lpep_dropoff_datetime = pd.to_datetime(df_chunk.lpep_dropoff_datetime)
        df_chunk.to_sql(
            name='green_taxi_data',
            con=dbengine,
            if_exists='append',
            index=False
        )
        print(f"> {iter_chunk} linhas carregadas na tabela green_taxi_data")
    except StopIteration:
        print("Processamento finalizado")
        break
    except Exception as e:
        print(f"Processamento finalizado com erro: {e}")

    print(f"> Todos os dados carregados para a tabela green_taxi_data")


