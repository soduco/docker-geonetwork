#!/bin/bash

# geonetwork data
docker run --rm --volumes-from 405_geonetwork_1 -v $(pwd)/backup:/backup ubuntu bash -c "tar xvf /backup/geonetwork.tar"
# es data
# docker run --rm --volumes-from 405_elasticsearch_1 -v $(pwd)/backup:/backup ubuntu bash -c "cd /usr/share/elasticsearch/data && tar xvf /backup/esdata.tar"
#es snapshots
# docker run --rm --volumes-from 405_elasticsearch_1 -v $(pwd)/backup:/backup ubuntu bash -c "cd /usr/share/elasticsearch/backup && tar xvf /backup/esbackup.tar"
# db data
# docker run --rm --volumes-from 405_database_1 -v $(pwd)/backup:/backup ubuntu bash -c "cd /var/lib/postgresql/data && tar xvf /backup/pgdata.tar"
# db log
# docker run --rm --volumes-from 405_database_1 -v $(pwd)/backup:/backup ubuntu bash -c "cd /var/log/postgresql && tar xvf /backup/pglog.tar"
