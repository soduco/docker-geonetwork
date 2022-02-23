#!/bin/bash

docker exec -t 405_database_1 pg_dumpall -c -U geonetwork > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
