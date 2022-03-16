#!/bin/bash

# check if there is a paramater
if [[ $# -eq 0 ]] ; then
    echo 'please choose the SQL dump you want to restore'
    exit 0
fi

# We need to drop the db first or default value won't be updated. 
# We can't drop the DB since it is accessed by other processes (tried to kill other containers, there was still processes)
# So we drop "public schema" and recreat it
docker exec -i 405_database_1 psql -U geonetwork -d geonetwork -c "DROP SCHEMA public CASCADE;"
docker exec -i 405_database_1 psql -U geonetwork -d geonetwork -c "CREATE SCHEMA public;"

# To update. Work for now since there is only one dump
cat "$1" | docker exec -i 405_database_1 psql -U geonetwork -d geonetwork
