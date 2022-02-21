#!/bin/bash

# We need to drop the db first or default value won't be updated. 
# We can't drop the DB since it is accessed by other processes (tried to kill other containers, there was still processes)
# So we drop "public schema" and recreat it
docker exec -i 405_database_1 psql -U geonetwork -d geonetwork -c "DROP SCHEMA public;"
docker exec -i 405_database_1 psql -U geonetwork -d geonetwork -c "CREATE SCHEMA public;"

# To update. Work for now since there is only one dump
cat dump_11-02-2022_16_26_40.sql | docker exec -i 405_database_1 psql -U geonetwork -d geonetwork
