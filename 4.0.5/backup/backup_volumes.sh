#!/bin/bash

# geonetwork data
docker run --rm --volumes-from 405_geonetwork_1 -v $(pwd)/backup:/backup ubuntu tar cvf /backup/geonetwork.tar /catalogue-data
# es data
docker run --rm --volumes-from 405_elasticsearch_1 -v $(pwd)/backup:/backup ubuntu tar cvf /backup/esdata.tar /usr/share/elasticsearch/data
#es snapshots
docker run --rm --volumes-from 405_elasticsearch_1 -v $(pwd)/backup:/backup ubuntu tar cvf /backup/esbackup.tar /usr/share/elasticsearch/backup
# db data
docker run --rm --volumes-from 405_database_1 -v $(pwd)/backup:/backup ubuntu tar cvf /backup/pgdata.tar /var/lib/postgresql/data
# db log
docker run --rm --volumes-from 405_database_1 -v $(pwd)/backup:/backup ubuntu tar cvf /backup/pglog.tar /var/log/postgresql
